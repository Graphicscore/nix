{
	description = "Asterias Nix Config";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }: {

		homeConfigurations =
			let
            pkgs = import nixpkgs {
            };
      in
			{
				asteria = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
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
						traits.base
						traits.workstation
					];
				};
		};

		nixosModules = {
				platforms.stardust = ./platforms/stardust.nix; #desktop pc
				platforms.polaris = ./platforms/polaris.nix; #framework 13

        traits.base = ./traits/base.nix;
        traits.gaming = ./traits/gaming.nix;
				traits.workstation = ./traits/workstation.nix;
    
        users.asteria = ./users/asteria/system.nix;
    };
	};
}
