{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim/nixos-24.05";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # outputs = { nixpkgs, stylix, ... }@inputs:
  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit system;
        };
        modules = [
          ./configuration.nix
          # pass
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.user = { pkgs, ... }: {
              home.username = "user";
              home.homeDirectory = "/home/user";
              programs.home-manager.enable = true;
              home.packages = with pkgs; [ spotify ];
              home.stateVersion = "24.05";
            };
          }
        ];
      };

      # homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      #   pkgs = pkgs;
      #   extraSpecialArgs = { inherit inputs; };
      #   modules = [ ./home.nix ];
      # };
    };

}
