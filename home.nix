{pkgs, lib, config, ...}:
	
	# let
	#     startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
	#       ${pkgs.waybar}/bin/waybar &
	#       sleep 1
	#     '';
	# in
	# {
        {
	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "23.11";
		
		packages = with pkgs; [
			fuzzel
			mako
			swayidle swaylock
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
