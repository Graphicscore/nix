{ config, pkgs, ... }:

{
  home.username = "asteria";
  home.homeDirectory = "/home/asteria";

  gtk = {
    enable = true;
   }

  home.packages = with pkgs; [
    neofetch
    nnn
    zip
    unzip
    file
    tree
    which
    nix-output-monitor
    glow
    btop
    lsof
    ltrace
    lm_sensors
    pciutils
    usbutils
    firefox
    openrgb
    spotify
    kitty
    vencord
    obs-studio
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.space-bar
  ];

  home.stateVersion = "25.05";

  programs.steam.enable = true;

  programs.git = {
    enable = true;
    userName = "Asteria Louven";
    userEmail = "asteria@louven.me";
  };

  programs.docker-cli = {
    enable = true;
  };

  config = {
    environment.systemPackages = with pkgs; [
      jetbrains.clion
      jetbrains.datagrip
      jetbrains.pycharm
      jetbrains.intellij
      wineWowPackages.staging
      wineWowPackages.waylandFull
      wineWowPackages.fonts
      winetricks
      mono
    ];

    hardware.opengl.driSupport32Bit = true;

    environment.variables = {
      WINEDEBUG = "-all";
      WINEESYNC = "1";
    };

    # CLion requires cargo-xlib.
    environment.noXlibs = lib.mkForce false;

    nixpkgs.config.allowUnfree = true;
  };
  }
