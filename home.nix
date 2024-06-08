{ pkgs, lib, config, inputs, ... }: {

	imports = [
		inputs.nix-colors.homeManagerModules.default
		./modules/mako.nix
		./modules/fuzzel.nix
		./modules/hyprland.nix
		./modules/kitty.nix
	];
	colorScheme = inputs.nix-colors.colorSchemes.horizon-terminal-dark;

	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "24.05";
		# sessionVariables.GTK_THEME = "Adwaita";
		packages = with pkgs; [
			fuzzel # run menu
			swayidle swaylock # screen lock
			grim slurp # screenshot tool
			brightnessctl # screen light
			pavucontrol

			libreoffice-fresh
			nautilus-open-in-blackbox
			unzip
			dconf
			mpv

			# theme
			gtk4
			libadwaita
			gradience
			qogir-icon-theme
			gnome.gnome-tweaks
			gnomeExtensions.user-themes
			xdg-desktop-portal-gtk
			xdg-desktop-portal-hyprland
		];
	};

	# dconf.settings = {
	# 	"org/gnome/desktop/interface" = {
	# 		color-scheme = "prefer-dark";
	# 	};
	# };
	qt.enable = true;
	qt.platformTheme = "gtk";
	qt.style.name = "adwaita-dark";
	qt.style.package = pkgs.adwaita-qt;

	gtk = {
		enable = true;
		cursorTheme.name = "Qogir-dark";
		# theme.package = pkgs.adw-gtk3;
		# theme.name = "Adwaita";
		#   iconTheme.name = "Adwaita";
		# theme.name = "Adwaita:dark";
		gtk4.extraConfig = {
			# gtk-application-prefer-dark-theme=1;
			# gtk-theme-name = "Adwaita";
		};
		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme=1;
			# gtk-theme-name = "Adwaita";
		};
		gtk4.extraCss = ''
@define-color accent_color rgb(125, 196, 228);
@define-color accent_bg_color #f4dbd6;
@define-color accent_fg_color rgb(24, 25, 38);
@define-color destructive_color rgb(238, 153, 160);
@define-color destructive_bg_color rgb(237, 135, 150);
@define-color destructive_fg_color rgb(24, 25, 38);
@define-color success_color rgb(166, 218, 149);
@define-color success_bg_color rgb(139, 213, 202);
@define-color success_fg_color rgb(24, 25, 38);
@define-color warning_color rgb(245, 169, 127);
@define-color warning_bg_color rgb(238, 212, 159);
@define-color warning_fg_color rgb(24, 25, 38);
@define-color error_color rgb(238, 153, 160);
@define-color error_bg_color rgb(237, 135, 150);
@define-color error_fg_color rgb(24, 25, 38);
@define-color window_bg_color rgb(36, 39, 58);
@define-color window_fg_color rgb(202, 211, 245);
@define-color view_bg_color rgb(30, 32, 48);
@define-color view_fg_color rgb(202, 211, 245);
@define-color headerbar_bg_color rgb(24, 25, 38);
@define-color headerbar_fg_color rgb(202, 211, 245);
@define-color headerbar_border_color rgb(110, 115, 141);
@define-color headerbar_backdrop_color @window_bg_color;
@define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
@define-color sidebar_bg_color rgb(24, 25, 38);
@define-color sidebar_fg_color rgb(202, 211, 245);
@define-color sidebar_border_color rgb(110, 115, 141);
@define-color sidebar_backdrop_color @window_bg_color;
@define-color sidebar_shade_color rgba(0, 0, 0, 0.36);
@define-color card_bg_color rgb(30, 32, 48);
@define-color card_fg_color rgb(202, 211, 245);
@define-color card_shade_color rgba(0, 0, 0, 0.36);
@define-color dialog_bg_color rgb(30, 32, 48);
@define-color dialog_fg_color rgb(202, 211, 245);
@define-color popover_bg_color rgb(30, 32, 48);
@define-color popover_fg_color rgb(202, 211, 245);
@define-color shade_color rgba(0,0,0,0.36);
@define-color scrollbar_outline_color rgba(0,0,0,0.5);
@define-color blue_1 #99c1f1;
@define-color blue_2 #62a0ea;
@define-color blue_3 #3584e4;
@define-color blue_4 #1c71d8;
@define-color blue_5 #1a5fb4;
@define-color green_1 #8ff0a4;
@define-color green_2 #57e389;
@define-color green_3 #33d17a;
@define-color green_4 #2ec27e;
@define-color green_5 #26a269;
@define-color yellow_1 #f9f06b;
@define-color yellow_2 #f8e45c;
@define-color yellow_3 #f6d32d;
@define-color yellow_4 #f5c211;
@define-color yellow_5 #e5a50a;
@define-color orange_1 #ffbe6f;
@define-color orange_2 #ffa348;
@define-color orange_3 #ff7800;
@define-color orange_4 #e66100;
@define-color orange_5 #c64600;
@define-color red_1 #f66151;
@define-color red_2 #ed333b;
@define-color red_3 #e01b24;
@define-color red_4 #c01c28;
@define-color red_5 #a51d2d;
@define-color purple_1 #dc8add;
@define-color purple_2 #c061cb;
@define-color purple_3 #9141ac;
@define-color purple_4 #813d9c;
@define-color purple_5 #613583;
@define-color brown_1 #cdab8f;
@define-color brown_2 #b5835a;
@define-color brown_3 #986a44;
@define-color brown_4 #865e3c;
@define-color brown_5 #63452c;
@define-color light_1 #ffffff;
@define-color light_2 #f6f5f4;
@define-color light_3 #deddda;
@define-color light_4 #c0bfbc;
@define-color light_5 #9a9996;
@define-color dark_1 #77767b;
@define-color dark_2 #5e5c64;
@define-color dark_3 #3d3846;
@define-color dark_4 #241f31;
@define-color dark_5 #000000;
		'';
		gtk3.extraCss = ''
@define-color accent_color #83a598;
@define-color accent_bg_color mix(#83a598, #282828,0.3);
@define-color accent_fg_color #d5c4a1;
@define-color destructive_color #83a598;
@define-color destructive_bg_color mix(#83a598, #282828,0.3);
@define-color destructive_fg_color #d5c4a1;
@define-color success_color #8ff0a4;
@define-color success_bg_color #26a269;
@define-color success_fg_color #d5c4a1;
@define-color warning_color #f8e45c;
@define-color warning_bg_color #cd9309;
@define-color warning_fg_color rgba(0, 0, 0, 0.8);
@define-color error_color #ff7b63;
@define-color error_bg_color mix(#83a598, #282828,0.3);
@define-color error_fg_color #d5c4a1;
@define-color window_bg_color #282828;
@define-color window_fg_color #d5c4a1;
@define-color view_bg_color #3c3836;
@define-color view_fg_color #d5c4a1;
@define-color headerbar_bg_color mix(#282828,black,0.2);
@define-color headerbar_fg_color #d5c4a1;
@define-color headerbar_border_color #d5c4a1;
@define-color headerbar_backdrop_color @window_bg_color;
@define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
@define-color card_bg_color rgba(255, 255, 255, 0.08);
@define-color card_fg_color #d5c4a1;
@define-color card_shade_color rgba(0, 0, 0, 0.36);
@define-color dialog_bg_color #665c54;
@define-color dialog_fg_color #d5c4a1;
@define-color popover_bg_color #665c54;
@define-color popover_fg_color #d5c4a1;
@define-color shade_color rgba(0,0,0,0.36);
@define-color scrollbar_outline_color rgba(0,0,0,0.5);
@define-color blue_1 #83a598;
@define-color blue_2 #83a598;
@define-color blue_3 #83a598;
@define-color blue_4 #83a598;
@define-color blue_5 #83a598;
@define-color green_1 #b8bb26;
@define-color green_2 #b8bb26;
@define-color green_3 #b8bb26;
@define-color green_4 #b8bb26;
@define-color green_5 #b8bb26;
@define-color yellow_1 #fabd2f;
@define-color yellow_2 #fabd2f;
@define-color yellow_3 #fabd2f;
@define-color yellow_4 #fabd2f;
@define-color yellow_5 #fabd2f;
@define-color orange_1 #fe8019;
@define-color orange_2 #fe8019;
@define-color orange_3 #fe8019;
@define-color orange_4 #fe8019;
@define-color orange_5 #fe8019;
@define-color red_1 #fb4934;
@define-color red_2 #fb4934;
@define-color red_3 #fb4934;
@define-color red_4 #fb4934;
@define-color red_5 #fb4934;
@define-color purple_1 #d3869b;
@define-color purple_2 #d3869b;
@define-color purple_3 #d3869b;
@define-color purple_4 #d3869b;
@define-color purple_5 #d3869b;
@define-color brown_1 #d65d0e;
@define-color brown_2 #d65d0e;
@define-color brown_3 #d65d0e;
@define-color brown_4 #d65d0e;
@define-color brown_5 #d65d0e;
@define-color light_1 #d5c4a1;
@define-color light_2 #f6f5f4;
@define-color light_3 #deddda;
@define-color light_4 #c0bfbc;
@define-color light_5 #9a9996;
@define-color dark_1 mix(#282828,white,0.5);
@define-color dark_2 mix(#282828,white,0.2);
@define-color dark_3 #282828;
@define-color dark_4 mix(#282828,black,0.2);
@define-color dark_5 mix(#282828,black,0.4);
		'';
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
			flake-rebuild = "sudo nixos-rebuild switch --flake \"/home/user/nix/.\"";
			home-rebuild = "home-manager switch --flake \"/home/user/nix/.\"";
			flake-upgrade = "sudo nix-channel --update && sudo nix flake update \"/home/user/nix/.\" && flake-rebuild";
			vi = "nvim";
			mwin = "sudo mount /dev/nvme0n1p3 /mnt/windows -t ntfs3";
			cdwin = "cd /mnt/windows/Users/user";
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
	
	programs = {
		btop.enable = true;
	};
}
