{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "stardust"; # Define your hostname.

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}