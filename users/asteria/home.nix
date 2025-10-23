{ config, pkgs, ... }:

{
  home.username = "asteria";
  home.homeDirectory = "/home/asteria";

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
  ];

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Asteria Louven";
    userEmail = "asteria@louven.me";
  };

  programs.docker-cli = {
    enable = true;
  };
  }
