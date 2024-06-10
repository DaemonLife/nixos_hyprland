{ pkgs, lib, config, inputs, ... }: {

	imports = [
		inputs.nix-colors.homeManagerModules.default
		inputs.nixvim.homeManagerModules.nixvim
		./modules/mako.nix
		./modules/fuzzel.nix
		./modules/hyprland.nix
		./modules/kitty.nix
		./modules/gtk.nix
		./modules/waybar.nix
		./modules/nixvim.nix
	];
	# colorScheme = inputs.nix-colors.colorSchemes.horizon-terminal-dark;
	colorScheme = inputs.nix-colors.colorSchemes.stella;

	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "24.05";
		packages = with pkgs; [
			fuzzel # run menu
			swayidle swaylock # screen lock
			grim slurp # screenshot tool
			brightnessctl # screen light
			pavucontrol # audio gui control
			gnome.gnome-power-manager # power statistic

			libreoffice-fresh
			nautilus-open-in-blackbox
			unzip
			dconf
			mpv

			# theme
			font-awesome
            vimix-icon-theme
			qogir-icon-theme
			gnome.gnome-tweaks
			gnomeExtensions.user-themes
		];
	};

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
		};
	};
	qt.enable = true;
	qt.platformTheme.name = "gtk";
	qt.style.name = "adwaita-dark";
	qt.style.package = pkgs.adwaita-qt;

    	programs.zsh = {
      		enable = true;
      		autosuggestion.enable = true;
      		syntaxHighlighting.enable = true;
		shellAliases = {
			flake-rebuild = "sudo nixos-rebuild switch --flake \"/home/user/nix/.\"";
			home-rebuild = "home-manager switch --flake \"/home/user/nix/.\"";
			flake-upgrade = "sudo nix-channel --update && sudo nix flake update \"/home/user/nix/.\" && flake-rebuild";
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

	programs = {
		btop.enable = true;
	};
}
