{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "stardust"; # Define your hostname.

  nixpkgs.hostPlatform = "x86_64-linux";
}