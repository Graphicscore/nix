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
    #nix-output-monitor
    glow
    btop
    lsof
    ltrace
    lm_sensors
    #pciutils
    #usbutils
    #firefox
    #openrgb
    #spotify
    #kitty
    #vencord
    #obs-studio
    #gnomeExtensions.user-themes
    #gnomeExtensions.tray-icons-reloaded
    #gnomeExtensions.vitals
    #gnomeExtensions.dash-to-panel
    #gnomeExtensions.sound-output-device-chooser
    #gnomeExtensions.space-bar
  ];

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Asteria Louven";
    userEmail = "asteria@louven.me";
  };

  #programs.docker-cli = {
  #  enable = true;
  #};
  }
