{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		initExtra = ''
			zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
			zstyle ':completion:*' menu no
			zstyle ':fzf-tab:complete:*' fzf-preview 'eza -1 --color=always $realpath'
		'';

		shellAliases =
			let flakeDir = "~/nix";
		in {
			nix-rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
			hm-rb = "home-manager switch --flake ${flakeDir}";
			cd = "z";
			ls = "eza";
			grep = "rg --color=auto";
			cat = "bat";
		};

		antidote = {
			enable = true;
			plugins = [
				"Aloxaf/fzf-tab"
			];
		};
	};
}
