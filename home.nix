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
        ./modules/telegram-theme.nix
        ./modules/git.nix
        ./modules/zsh.nix
	];
	colorScheme = inputs.nix-colors.colorSchemes.horizon-terminal-dark;

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

            # - For Hyprland
			fuzzel # run menu
			grim slurp # screenshot tool
			brightnessctl # screen light
			pavucontrol # audio gui control
            # wl-clipboard
            alsa-utils # audio volume control (?)
            # pulseaudio-ctl # audio volume control (?)
			gnome.gnome-power-manager # power statistic
            hypridle swaylock # screen lock
			
            # Theming
            vimix-icon-theme
			qogir-icon-theme
			gnome.gnome-tweaks
            swaybg
            flavours # create base16 colors from image

            # Fonts
			font-awesome
            fira
            cantarell-fonts
            inter
            roboto

            # - Other
            btop
			libreoffice-fresh
			nautilus-open-in-blackbox # right click open menu
			unzip
			dconf
			mpv
            ffmpeg-full
            transmission_4-gtk # torrent client
            telegram-desktop
            cmus # player
            python3
            pipx
            tor-browser
            bottles

		];
        sessionPath = [
            "$HOME/.local/bin"
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

}
