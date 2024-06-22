{
  programs.alacritty = {
    enable = true;
    settings = {
 	    live_config_reload = true;
 	    shell = {
 	        program = "tmux";
 	        args = ["new-session" "-A" "-s" "general"];
 	    };
 	    env.TERM = "xterm-256color";
 	    window = {
 	        padding.x = 3;
 	        padding.y = 3;
 	        opacity = 1.0;
 	        startup_mode = "Maximized";
 	    };
 	    scrolling = {
 	        history = 10000;
 	        multiplier = 3;
 	    };
      font = {
        size = 10;
        normal = { family = "Iosevka"; style = "Regular"; };
        bold = { family = "Iosevka"; style = "Bold"; };
        italic = { family = "Iosevka"; style = "Italic"; };
      };
 	    cursor = {
 	        style.shape = "Block";
 	        style.blinking = "Always";
          unfocused_hollow = false;
 	    };
 	    mouse.hide_when_typing = true;
 	    selection.save_to_clipboard = true;
    };
  };
}
