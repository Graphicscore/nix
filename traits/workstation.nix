{ config, pkgs, lib, ...}:

{
 config = {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gnome-characters
      gnome-contacts
      gnome-initial-setup
    ]);

  # So gtk themes can be set
  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [ dconf ];

  hardware.steam-hardware.enable = true;

  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    #jetbrains-mono
  ];

  systemd.services.spotifyd.enable = true;
  services.printing.enable = true;
  environment.systemPackages = with pkgs; [
      #virt-manager
      gnome-tweaks
      gnome-characters
      cheese # webcam tool
      #jetbrains.clion
      #jetbrains.datagrip
      #jetbrains.pycharm
      #jetbrains.intellij
      #wineWowPackages.staging
      #wineWowPackages.waylandFull
      #wineWowPackages.fonts
      #winetricks
      #mono
  ];

  hardware.graphics.enable32Bit = true;

  environment.variables = {
    WINEDEBUG = "-all";
    WINEESYNC = "1";
  };

  nixpkgs.config.allowUnfree = true;
  
  #programs.steam.enable = true;
 };
}