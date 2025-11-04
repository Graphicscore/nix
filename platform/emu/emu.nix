{ config, lib, pkgs, modulesPath, ... }:


{

  imports = [ 
    (modulesPath + "/profiles/qemu-guest.nix")
    ../stardust/stardust.nix 
    ];

  networking.hostName = "stardust-emu";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ohci_pci" "ehci_pci" "virtio_pci" "ahci" "usbhid" "sr_mod" "virtio_blk" ];

  boot.initrd.kernelModules = [ ];

  boot.kernelModules = [ "kvm-amd" ];

  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e7274ece-7166-4f41-96f8-b4336212921b";
      fsType = "ext4";
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A36A-653C";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };


  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s9.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}