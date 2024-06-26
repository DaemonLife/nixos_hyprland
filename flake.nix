{
description = "My flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	hyprland.url = "github:hyprwm/Hyprland";
	nix-colors.url = "github:misterio77/nix-colors";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	nixvim = {
		url = "github:nix-community/nixvim";
		inputs.nixpkgs.follows = "nixpkgs";
	};
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
		modules = [ ./configuration.nix ];
	};

	homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
		pkgs = nixpkgs.legacyPackages.${system};
		extraSpecialArgs = { inherit inputs; };
		modules = [ 
			./home.nix 
		];
	}; 

};
}
