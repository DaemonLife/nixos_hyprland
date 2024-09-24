{
description = "My flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
	# hyprland.url = "github:hyprwm/Hyprland";
	nix-colors.url = "github:misterio77/nix-colors";
	home-manager = {
		url = "github:nix-community/home-manager/release-24.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	nixvim = {
		url = "github:nix-community/nixvim/nixos-24.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

outputs = { self, nixpkgs, home-manager, ... }@inputs:
let
	system = "x86_64-linux";
    # Import nixpkgs with allowUnfree set to true
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };
in {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = {
                inherit pkgs;
                inherit system;
			};
		modules = [ ./configuration.nix ];
	};

	homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
		pkgs = pkgs;
		extraSpecialArgs = { inherit inputs; };
		modules = [ ./home.nix ];
	}; 
  };

}
