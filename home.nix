{ pkgs, lib, config, inputs, ... }: {

  imports = [ ./modules/import_all.nix ];

  stylix.targets = {
    waybar.enable = false;
    yazi.enable = false;
  };

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
      hypridle # timer for screen lock
      swaylock # screen lock
      wl-clipboard
      btop
      cool-retro-term
      unzip
      python3
      nodejs
      pipx
      exiftool
      xdragon
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
      imv # cli image viewer
      imagemagick
      ffmpegthumbnailer
      halftone # image pixel redactor
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
      dconf
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

      yt-dlp
      bottles
      veracrypt
      fastfetch # system info in terminal
      cmatrix # matrix in terminal
      wev # key events in wayland

      # --------------------------------
      # USER SOFT
      # --------------------------------

      # Media
      cmus # player
      musikcube # second music player
      unstable.darktable
      unstable.gimp

      # Internet
      transmission_4
      qbittorrent # torrent client
      tor-browser

      # Docs
      jrnl
      libreoffice
      unstable.joplin
      stellarium # astro map ASCII
      unstable.astroterm # astro map
      epy # cli book reader
      tldr # community documentation
      russ # rss tui reader

      # Gaming
      portablemc # minecraft cli launcher
      curseofwar # stategy cli game
      vitetris # tetris cli game
      # dwarf-fortress
      dwarf-fortress-packages.dwarf-fortress-full

    ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  dconf.settings = {
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
}
