# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/user.nix
    inputs.sops-nix.nixosModules.sops
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Development environment & CLI tools
    alacritty
    atuin
    bat
    delta
    eza
    fzf
    fzf-git-sh
    git
    helix
    starship
    thefuck
    tldr
    tmux
    tree
    zoxide
    zsh
    zig
    zls
    taplo
    marksman
    python3
    ripgrep
    libclang
    lldb
    gdb
    lazygit
    btop
    qemu
    gh
    gcc
    hexyl
    heaptrack
    minicom
    spike
    sops

    # Desktop apps
    brave
    discord-screenaudio
    obsidian
    spotify
    steam
    zoom-us
    virtualbox
    bless
    ghidra
    cutter
    lutris

    # Other
    home-manager
    wine
    protonup
    jdk
    xwayland
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  fonts.packages = with pkgs; [
    iosevka
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Sops
  sops.defaultSopsFormat = "yaml";
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.age.keyFile = "/home/mkflan/.config/sops/age/keys.txt";

  system.stateVersion = "24.05";
}
