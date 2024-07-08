{ config, pkgs, ... }: {
	imports = [
		./modules/alacritty.nix
		./modules/git.nix
		./modules/helix.nix
		./modules/starship.nix
		./modules/tmux.nix
		./modules/zsh.nix		
		./modules/fzf.nix
		./modules/thefuck.nix
		./modules/zoxide.nix
	];

	home = {
		username = "mkflan";
		homeDirectory = "/home/mkflan";
		stateVersion = "23.11";
	};
}
