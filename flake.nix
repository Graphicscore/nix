{
	description = "Asterias Nix Config";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
	};

	outputs = inputs@{ self, nixpkgs, home-manager, plasma-manager, ... }: {

		homeConfigurations = {
			asteria = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; };
				modules = [
					./users/asteria/home.nix
				];
			};
		};

		nixosConfigurations = with self.nixosModules; { 
				stardust = nixpkgs.lib.nixosSystem {
					modules = [
						./configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
						}
						traits.base
						#traits.workstation
						traits.ssh
						traits.i18n
						traits.network
						platforms.stardust
						users.asteria
					];
				};
		};

		nixosModules = {
				platforms.stardust = ./platform/stardust.nix; #desktop pc
				platforms.polaris = ./platform/polaris.nix; #framework 13

        traits.base = ./traits/base.nix;
        #traits.gaming = ./traits/gaming.nix;
				#traits.workstation = ./traits/workstation.nix;

				traits.ssh = ./traits/ssh.nix;
				traits.i18n = ./traits/i18n.nix;
				traits.network = ./traits/network.nix;
    
        users.asteria = ./users/asteria/system.nix;
    };
	};
}
