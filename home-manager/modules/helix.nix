{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      zls
      taplo
      marksman
    ];
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        bufferline = "always";
        true-color = true;
        auto-save = true;
        mouse = false;
        shell = ["zsh" "-c"];
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        statusline = {
          left = ["mode" "spinner"];
          center = ["file-name" "read-only-indicator" "file-modification-indicator"];
          right = ["diagnostics" "register" "position" "file-encoding"];
        };
      };
      keys = {
        normal = {
          esc = ["collapse_selection" "keep_primary_selection"];
          backspace = {
            c = [":open ~/nix/home-manager/modules/helix.nix"];
            r = [":w" ":sh home-manager switch --flake ~/nix"];
            l = [":buffer-close"];
            o = [":buffer-close-others"];
          };
          C-z = ":earlier";
          C-u = ":later";
          C-d = ":w";
          space.e.h = ":toggle lsp.display-inlay-hints";
        };
      };  
    };
  };  
}
