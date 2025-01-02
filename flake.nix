{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = { self, nixpkgs, home-manager, stylix, nixvim, nixpkgs-unstable, nixos-hardware, ... }@inputs:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system; };

  # Creating configuration function
  mkNixosConfig = device: {
    inherit system;
    modules = builtins.concatLists [
      [
        ./configuration.nix # main config
        ./devices/${device}/configuration.nix # device config
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user.imports = [
            ./home.nix # main home config
            ./devices/${device}/home.nix # device home config
          ];
          home-manager.backupFileExtension = "bkp";
        }
        {
          nixpkgs.overlays = [
            (final: prev: {
              unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            })
          ];
        }
      ]
      # Добавляем модуль только если device равно "gpd-pocket-3"
      (if device == "gpd-pocket-3___" then [ nixos-hardware.nixosModules.${device} ] else [])
    ];
  };

in {
  nixosConfigurations = {
    # create configurations for my devices
    gpd-pocket-3 = nixpkgs.lib.nixosSystem (mkNixosConfig "gpd-pocket-3");
    lenovo = nixpkgs.lib.nixosSystem (mkNixosConfig "lenovo"); 
  }; # end of nixosConfigurations
}; # end of outputs

}
