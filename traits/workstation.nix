{ config, pkgs, lib, ...}:

{
 config = {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      gnome-characters
      gnome-contacts
      gnome-initial-setup
    ]);

  # So gtk themes can be set
  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [ dconf ];

  hardware.opengl.driSupport = true;
  hardware.steam-hardware.enable = true;

  fonts.fontconfig.enable = true;
  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
    fira-code
    fira-code-symbols
  ];

  systemd.services.spotifyd.enable = true;
  services.printing.enable = true;
  environment.systemPackages = with pkgs; [
      virt-manager
      gnome.gnome-tweaks
      gnome.gnome-characters
      cheese # webcam tool
  ];
 };
}