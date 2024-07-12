{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    prefix = "C-Space";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    keyMode = "vi";
    plugins = with pkgs; [
	    tmuxPlugins.vim-tmux-navigator
	    tmuxPlugins.yank
	    tmuxPlugins.tmux-fzf
	    tmuxPlugins.sensible
	    tmuxPlugins.nord
      tmuxPlugins.copycat
    ];
    extraConfig = ''
      # Color
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

	    # Open new panes in CWD
	    bind '"' split-window -v -c "#{pane_current_path}"
	    bind % split-window -h -c "#{pane_current_path}"

	    # Keybindings
	    bind-key -T copy-mode-vi v send-keys -X begin-selection
	    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
	    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
     
      # Other
      set-option -g status-position top
    '';
  };  
}
