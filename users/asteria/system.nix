{ lib, pkgs, ... }:

{
  config = {
    home-manager.users.asteria = ./home.nix;
    users.users.asteria = {
      isNormalUser = true;
      home = "/home/asteria";
      createHome = true;
      passwordFile = "/persist/encrypted-passwords/asteria";
      extraGroups = [ "wheel" "disk" "networkmanager" "libvirtd" "qemu-libvirtd" "kvm" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICApdJZ55ToUq4FgBBL0yq0NAwW+PLBBLjH+SN29x21w asteria@asteria-MS-7D75"
      ];
    };
  };
}