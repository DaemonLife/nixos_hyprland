{ pkgs, lib, config, inputs, ... }: {

	imports = [
		inputs.nix-colors.homeManagerModules.default
		./features/mako.nix
		./hyprland.nix
	];
	
	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "23.11";
		sessionVariables.GTK_THEME = "Adwaita-dark";

		packages = with pkgs; [
			fuzzel # run menu
			# mako # notifications
			swayidle swaylock # screen lock
			grim slurp # screenshot tool
			brightnessctl # screen light

			libreoffice-fresh
			xfce.thunar
			unzip
		];
	};

	programs.waybar = {
		enable = true;
		package = pkgs.waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
		});
	};
    
    	programs.zsh = {
      		enable = true;
      		enableAutosuggestions = true;
      		syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild-nixos = "sudo nixos-rebuild switch --flake \"/home/user/nix/.\"";
			rebuild-home = "home-manager switch --flake \"/home/user/nix/.\"";
			update-nixos = "sudo nix-channel --update && sudo nix flake update \"/home/user/nix/.\" && rebuild-nixos";
		};
      		oh-my-zsh = {
        		enable = true;
        		theme = "frisk";
        		plugins = [
	  			"git"
        		];
      		};
    	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			nerdtree
			tcomment_vim
		];
	};

}
