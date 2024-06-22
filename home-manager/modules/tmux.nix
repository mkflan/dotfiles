{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    prefix = "C-b";
    plugins = with pkgs; [
	    tmuxPlugins.vim-tmux-navigator
	    tmuxPlugins.yank
	    tmuxPlugins.tmux-fzf
	    tmuxPlugins.sensible
	    tmuxPlugins.nord
    ];
    extraConfig = ''
      # Color
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

	    # Enable mouse
	    set -g mouse on

	    # Start windows and panes at 1 instead of 0
	    set -g base-index 1
	    set -g pane-base-index 1
	    set-window-option -g pane-base-index 1
	    set-option -g renumber-windows on

	    # Open new panes in CWD
	    bind '"' split-window -v -c "#{pane_current_path}"
	    bind % split-window -h -c "#{pane_current_path}"

	    set-window-option -g mode-keys vi

	    # Keybindings
	    bind-key -T copy-mode-vi v send-keys -X begin-selection
	    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
	    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };  
}
