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

		nixosConfigurations = with self.nixosModules; let
			# Shared base modules that both configurations use
			baseModules = [
				./configuration.nix
				{
					nixpkgs.overlays = [
						(import ./overlays/plasma/itchy-theme.nix)
					];
    		}	
			
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
				}
				traits.base
				traits.ssh
				traits.i18n
				traits.network
				users.asteria
			];
		in {
			stardust = nixpkgs.lib.nixosSystem {
				modules = baseModules ++ [
					platforms.stardust
				];
			};
			
			polaris = nixpkgs.lib.nixosSystem {
				modules = baseModules ++ [
					platforms.polaris
					# Add any polaris-specific modules here
				];
			};

			stardust-emu = nixpkgs.lib.nixosSystem {
				modules = baseModules ++ [
					platforms.stardust-emu
					# Add any stardust-emu-specific modules here
				];
			};
		};

		nixosModules = {
				platforms.stardust = ./platform/stardust/stardust.nix; #desktop pc
				platforms.polaris = ./platform/polaris/polaris.nix; #framework
				platforms.stardust-emu = ./platform/emu/emu.nix; #desktop pc

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
