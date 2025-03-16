{ pkgs, lib, config, inputs, ... }: {

  imports = [ ./modules/_import.nix ];

  stylix.targets = { yazi.enable = false; };

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "24.05";

    packages = with pkgs; [

      # --------------------------------
      # SOFT FOR DE 
      # --------------------------------

      # DE and system
      libnotify # for mako notifications
      grimblast
      brightnessctl # screen light
      gnome-power-manager # power statistic
      wl-clipboard
      cool-retro-term
      unzip
      python3
      nodejs
      pipx
      exiftool
      xdragon
      swayidle
      # xdg-desktop-portal-termfilechooser # for choosing your favorite file chooser

      # Disk
      dua # disk usage TUI tool. Run: dua i

      # Network
      overskride # bluetooth gui
      bluetui # bluetooth tui
      # telegram-desktop # no bin...
      materialgram
      nchat
      bitwarden-cli

      # Media
      imagemagick
      ffmpegthumbnailer
      ffmpeg-full
      helvum # A GTK patchbay for pipewire
      pavucontrol # audio gui control
      alsa-utils # audio volume control (?)
      pulsemixer # cli pulse adudio control
      digikam
      qimgv # img viewer

      # Theming
      vimix-icon-theme # for icons
      qogir-icon-theme # for cursor
      gnome-tweaks
      swaybg # background
      unstable.gowall # Tool to convert a Wallpaper's color scheme. Still wait version 2...
      dconf-editor

      # Fonts
      nerdfonts
      font-awesome
      fira
      cantarell-fonts

      # spellcheck for LibreOffice
      hunspell
      hunspellDicts.ru_RU
      hunspellDicts.en_US

      bottles
      veracrypt
      cmatrix # matrix in terminal
      wev # key events in wayland

      # --------------------------------
      # USER SOFT
      # --------------------------------

      # Media
      musikcube # second music player
      termusic
      unstable.darktable
      unstable.gimp

      # Internet
      qbittorrent # torrent client
      tor-browser

      # Docs
      jrnl
      libreoffice
      joplin
      stellarium # astro map
      unstable.astroterm # astro map ASCII
      epy # cli book reader
      tldr # community documentation
      russ # rss tui reader
      gnome-feeds # gui rss reader

      # Gaming
      portablemc # minecraft cli launcher
      curseofwar # stategy cli game
      vitetris # tetris cli game
      dwarf-fortress-packages.dwarf-fortress-full

    ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  # --------------------------------
  # PROGRAMS SETUP
  # --------------------------------

  programs = {

    fastfetch = { enable = true; };
    yt-dlp = { enable = true; };
    imv = { enable = true; };

    btop = {
      enable = true;
      settings = {
        color_theme = lib.mkForce "TTY";
        theme_background = lib.mkForce false;
        rounded_corners = lib.mkForce false;
        vim_keys = lib.mkForce true;
      };
    };

  };

  dconf = {
    settings = {
      # disable top right buttons
      "org/gnome/desktop/wm/preferences" = { button-layout = ""; };

      "org/gnome/desktop/peripherals/touchpad" = {
        tap-and-drag = false;
        # speed = -0.8;
        natural-scroll = false;
        accel-profile = "adaptive";
      };
      "org/gnome/desktop/peripherals/mouse" = {
        # speed = -0.3;
        natural-scroll = false;
        accel-profile = "adaptive";
      };
    };
  };
}
