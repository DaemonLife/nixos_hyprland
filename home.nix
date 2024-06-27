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
        ./modules/firefox.nix
        ./modules/mpv.nix
        ./modules/hypridle.nix
        ./modules/swaylock.nix
	];
	colorScheme = inputs.nix-colors.colorSchemes.stella;

  #   colorScheme = {
  #   slug = "myown";
  #   name = "Myown";
  #   author = "Me!";
  #   palette = {
  #     base00 = "#2e2421";
  #     base01 = "#4f4540";
  #     base02 = "#716660";
  #     base03 = "#93877f";
  #     base04 = "#b4a89e";
  #     base05 = "#d6c9bd";
  #     base06 = "#dcd1c7";
  #     base07 = "#e2d9d1";
  #     base08 = "#6f76a1";
  #     base09 = "#7673a3";
  #     base0A = "#6f7893";
  #     base0B = "#c2574d";
  #     base0C = "#717b6b";
  #     base0D = "#ab6744";
  #     base0E = "#8e7174";
  #     base0F = "#778698";
  #   };
  # };

	home = {
		username = "user";
		homeDirectory = "/home/user";
		stateVersion = "24.05";
		packages = with pkgs; [
			fuzzel # run menu
			grim slurp # screenshot tool
			brightnessctl # screen light
			pavucontrol # audio gui control
			gnome.gnome-power-manager # power statistic
            hypridle swaylock # screen lock

			libreoffice-fresh
			nautilus-open-in-blackbox
			unzip
			dconf
			mpv
            ffmpeg-full
            transmission_4-gtk
            telegram-desktop
            tor-browser

			#Theming
            # gtk3
			font-awesome
            vimix-icon-theme
			qogir-icon-theme
			gnome.gnome-tweaks
			gnomeExtensions.user-themes
            swaybg
            flavours # create base16 colors from image
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
        hextorgb = "sh /home/user/nix/scripts/hextorgb.sh";
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
