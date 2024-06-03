{
	description = "My flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		home-manager = {
      			url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
      			inputs.nixpkgs.follows = "nixpkgs";
    		};
		
		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs:
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {
				pkgs = import nixpkgs {
					inherit system;
					config.allowUnfree = true;
				};
				inherit system;
			};
			modules = [
				./configuration.nix
				# ./hyprland.nix
				# inputs.home-manager.nixosModules.default
				];
		};

		homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
     			pkgs = nixpkgs.legacyPackages.${system};
     			modules = [
				./home.nix
				./hyprland.nix
			];	
		}; 

	};
}
