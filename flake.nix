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

    # Функция для создания конфигурации
    mkNixosConfig = device: {
      inherit system;
      modules = [
        ./main-configuration.nix
        ./${device}-configuration.nix
        nixos-hardware.nixosModules.${device}
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = import ./home.nix;
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
      ];
    };

  in {
    nixosConfigurations = {
      gpd-pocket-3 = nixpkgs.lib.nixosSystem (mkNixosConfig "gpd-pocket-3");
      lenovo = nixpkgs.lib.nixosSystem (mkNixosConfig "lenovo"); # Добавляем конфигурацию для Lenovo
    }; # end of nixosConfigurations
  }; # end of outputs



}
