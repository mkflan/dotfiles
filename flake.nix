{
	description = "My NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		sops-nix.url = "github:Mic92/sops-nix";
		lanzaboote.url = "github:nix-community/lanzaboote/v0.4.1";

		rust-overlay = {
			url = "github:oxalica/rust-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... } @ inputs: 
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };
			modules = [ 
				./core/configuration.nix 
				inputs.lanzaboote.nixosModules.lanzaboote
				({ pkgs, ... }: {
					nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
					environment.systemPackages = let
						rust = pkgs.rust-bin.nightly.latest.default.override {
							extensions = [ "miri" "rust-src" ];
						}; 
					in
						[ rust ];
				})
			];
		};

		homeConfigurations.mkflan = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home-manager/home.nix ];
		};
	};
}
