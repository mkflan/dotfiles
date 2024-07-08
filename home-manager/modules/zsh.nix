{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		initExtra = ''
			zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
			zstyle ':completion:*' menu no
			zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
		'';

		shellAliases =
			let flakeDir = "~/nix";
		in {
			econf = "hx ${flakeDir}";
			nix-rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
			hm-rb = "home-manager switch --flake ${flakeDir}";
			cd = "z";
			ls = "eza --color";
			grep = "rg --color=auto";
			cat = "bat";
		};

		history = 
			let hist_size = 5000;
		in {
			size = hist_size;
			save = hist_size;
			ignoreAllDups = true;
			ignoreDups = true;
		};

		antidote = {
			enable = true;
			plugins = [
				"Aloxaf/fzf-tab"
			];
		};
	};
}
