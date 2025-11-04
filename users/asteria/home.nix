{ config, pkgs, lib,  ... }:

{
  home.username = "asteria";
  home.homeDirectory = "/home/asteria";

 # gtk = {
 #   enable = true;
 # };

  home.packages = with pkgs; [
    neofetch
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

    ungoogled-chromium
    firefox
    itchy-theme
    #openrgb
    spotify
    kitty

    telegram-desktop
    vencord
    obs-studio
  ];

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Asteria Louven";
    userEmail = "asteria@louven.me";
  };

  programs.plasma = {
    enable = true;
    
    workspace = {
      theme = "itchy"; # This should match the theme name from the package
    };
  };

  #programs.docker-cli = {
  #  enable = true;
  #};
  }
