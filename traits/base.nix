{ config, pkgs, lib, ... }:

{
  config = {


    services = {
      desktopManager.plasma6.enable = true;

      displayManager.sddm.enable = true;

      displayManager.sddm.wayland.enable = true;
    };


    # rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
      };
    };

     services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 32;
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 32;
    };
  };

  services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
  context.modules = [
    {
      name = "libpipewire-module-protocol-pulse";
      args = {
        pulse.min.req = "32/48000";
        pulse.default.req = "32/48000";
        pulse.max.req = "32/48000";
        pulse.min.quantum = "32/48000";
        pulse.max.quantum = "32/48000";
      };
    }
  ];
  stream.properties = {
    node.latency = "32/48000";
    resample.quality = 1;
  };
};


    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "de_DE.UTF-8";

    environment.plasma6.excludePackages = with pkgs; [
      kdePackages.elisa # Simple music player aiming to provide a nice experience for its users
      kdePackages.kdepim-runtime # Akonadi agents and resources
      kdePackages.kmahjongg # KMahjongg is a tile matching game for one or two players
      kdePackages.kmines # KMines is the classic Minesweeper game
      kdePackages.konversation # User-friendly and fully-featured IRC client
      kdePackages.kpat # KPatience offers a selection of solitaire card games
      kdePackages.ksudoku # KSudoku is a logic-based symbol placement puzzle
      kdePackages.ktorrent # Powerful BitTorrent client
      mpv
    ];

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
#      simple-http-server
      curl
      wget
      wl-clipboard
      kdePackages.sddm-kcm # Configuration module for SDDM
      
    ];
    #environment.shellAliases = { };
    #environment.variables = {
    #
    #};
    #environment.pathsToLink = [
    #  "/share/nix-direnv"
    #];

   
    programs.bash.loginShellInit = ''
      HAS_SHOWN_NEOFETCH=''${HAS_SHOWN_NEOFETCH:-false}
      if [[ $- == *i* ]] && [[ "$HAS_SHOWN_NEOFETCH" == "false" ]]; then
        ${pkgs.neofetch}/bin/neofetch --config ${../config/neofetch/config}
        HAS_SHOWN_NEOFETCH=true
      fi
    '';

    security.sudo.wheelNeedsPassword = false;
    #security.sudo.extraConfig = ''
    #  Defaults lecture = never
    #'';

    # Use edge NixOS.
    
    nix.settings.experimental-features = [ "nix-command" "flakes"];
    #nix.package = pkgs;

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    nixpkgs.config.allowUnfree = true;

    # Configure console keymap
    console.keyMap = "de";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
  };
}