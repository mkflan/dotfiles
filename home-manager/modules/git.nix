{
  programs.git = {
    enable = true;
    userName = "mkflan";
    userEmail = "mkflan@protonmail.com";
    aliases = {
      aa = "add -A";
    };
    delta.enable = true;
    extraConfig = {
      init.defaultBranch = "master";
    };
  };
}
