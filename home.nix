{pkgs, lib, config, ...}: {

	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "23.11";
		
		packages = with pkgs; [
			fuzzel # run menu
			mako # notifications
			swayidle swaylock # screen lock
			grim slurp # screenshot tool
			brightnessctl # screen light
		];
	};
	imports = [
		./hyprland.nix
	];
  	programs = {
		waybar = {
      			enable = true;
      			package = pkgs.waybar.overrideAttrs (oldAttrs: {
        			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  	    		});
  		};
	};
    
    	programs.zsh = {
      		enable = true;
      		enableAutosuggestions = true;
      		syntaxHighlighting.enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
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
			gruvbox-material
			nerdtree
			tcomment_vim
		];
	};

}
