{ pkgs, lib, config, inputs, ... }: {

  imports = [
    ./modules/mako.nix
    ./modules/fuzzel.nix
    ./modules/hyprland.nix
    # ./modules/kitty.nix
    ./modules/alacritty.nix
    # ./modules/gtk.nix
    ./modules/waybar.nix
    ./modules/firefox.nix
    ./modules/mpv.nix
    ./modules/hypridle.nix
    ./modules/swaylock.nix
    ./modules/telegram-theme.nix
    ./modules/git.nix
    # ./modules/zsh.nix
    ./modules/cmus.nix
    ./modules/jrnl.nix
    # ./modules/helix.nix
    ./modules/nixvim.nix
    # ./modules/ranger.nix
    ./modules/lf.nix
    ./modules/fish.nix
    ./modules/rtorrent.nix
    ./modules/qutebrowser.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
    override = {
      author = "DaemonLife";
      # base00 = "000000";
      #   base01 = "121212";
      #   base02 = "000000";
      #   base03 = "000000";
      #   base04 = "000000";
      #   base05 = "000000";
      #   base06 = "000000";
      #   base07 = "000000";
      #   base08 = "000000";
      #   base09 = "000000";
      #   base0A = "000000";
      #   base0B = "000000";
      #   base0C = "000000";
      #   base0D = "000000";
      #   base0E = "000000";
      #   base0F = "000000";
    };
    # image = ./image.jpg;
    image = config.lib.stylix.pixel "base00";
    targets.waybar.enable = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 21;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "GeistMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 16;
        terminal = 15;
        desktop = 16;
        popups = 12;
      };
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    polarity = "dark";
  };

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "24.05";

    packages = with pkgs; [

      # --------------------------------
      # SOFT FOR DE 
      # --------------------------------

      # Main
      # kitty
      alacritty
      fuzzel # run menu
      mako # notification agent
      libnotify # for mako
      grim
      slurp # screenshot tool
      brightnessctl # screen light
      pavucontrol # audio gui control
      alsa-utils # audio volume control (?)
      gnome-power-manager # power statistic
      hypridle
      swaylock # screen lock
      ffmpegthumbnailer
      ueberzugpp # image preview
      lf
      nautilus
      nautilus-open-any-terminal

      # Theming
      vimix-icon-theme # for icons
      qogir-icon-theme # for cursor
      gnome-tweaks
      swaybg # background
      flavours # create base16 colors from image
      dconf
      dconf-editor

      # Fonts
      nerdfonts
      font-awesome
      fira
      cantarell-fonts

      # --------------------------------
      # OTHER SOFT
      # --------------------------------

      # spellcheck and LibreOffice
      hunspell
      hunspellDicts.ru_RU
      hunspellDicts.en_US
      libreoffice

      unstable.joplin
      unstable.gimp
      halftone # image pixel redactor
      # qutebrowser
      btop
      cool-retro-term
      unzip
      epy # cli book reader
      jrnl
      mpv
      ffmpeg-full
      transmission_4
      qbittorrent # torrent client
      # rtorrent
      telegram-desktop
      cmus # player
      python3
      pipx
      tor-browser
      bottles
      veracrypt
      portablemc # minecraft cli launcher
      fastfetch # system info in terminal
      curseofwar
      vitetris # cli games
      cmatrix

    ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-and-drag = false;
      speed = -0.8;
      natural-scroll = false;
      accel-profile = "adaptive";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = -0.3;
      natural-scroll = false;
      accel-profile = "adaptive";
    };
  };

}
