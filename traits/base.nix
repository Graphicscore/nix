{ config, pkgs, lib, ... }:

{
  config = {
    time.timeZone = "Europe/Berlin";
    

    i18n.defaultLocale = "de_DE.UTF-8";

    environment.systemPackages = with pkgs; [
      # Shell utilities
      git
      jq
      lsof
      htop
      btop
      lsd
      ntfs3g
      killall
      gptfdisk
      fio
      smartmontools
      simple-http-server
    ];
    environment.shellAliases = { };
    environment.variables = {
    
    };
    environment.pathsToLink = [
      "/share/nix-direnv"
    ];

   
    programs.bash.loginShellInit = ''
      HAS_SHOWN_NEOFETCH=''${HAS_SHOWN_NEOFETCH:-false}
      if [[ $- == *i* ]] && [[ "$HAS_SHOWN_NEOFETCH" == "false" ]]; then
        ${pkgs.neofetch}/bin/neofetch --config ${../config/neofetch/config}
        HAS_SHOWN_NEOFETCH=true
      fi
    '';

    security.sudo.wheelNeedsPassword = false;
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    # Use edge NixOS.
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
    #nix.package = pkgs.nixUnstable;

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    nixpkgs.config.allowUnfree = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
  };
}