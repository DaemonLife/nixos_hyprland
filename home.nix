{ pkgs, lib, config, inputs, ... }: {

  imports = [ ./modules/import_all.nix ];

  stylix = {
    enable = true;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ./images/image.jpg;
    override = {
      author = "DaemonLife";
      #   # one tone gradient
      #   base00 = "232a2d"; # BACKGROUND (BLACK)
      #   base01 = "e57474"; # bright green
      #   base02 = "8ccf7e"; # bright yellow
      #   base03 = "e5c76b"; # bright black
      #   base04 = "67b0e8"; # bright blue
      #   base05 = "c47fd5"; # FOREGROUND (WHITE)
      #   base06 = "6cbfbf"; # bright magenta
      #   base07 = "b3b9b8"; # bright white

      #   # colors
      #   base08 = "2d3437"; # RED
      #   base09 = "ef7e7e"; # bright red
      #   base0A = "96d988"; # YELLOW
      #   base0B = "f4d67a"; # GREEN
      #   base0C = "71baf2"; # CYAN
      #   base0D = "ce89df"; # BLUE
      #   base0E = "67cbe7"; # MAGENTA
      base0F = "c38cd2"; # bright cyan # no. fixed dumb everforest color
    };
    targets.waybar.enable = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

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

      # DE and system
      libnotify # for mako notifications
      grim # screenshot tool
      slurp # screenshot tool
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

      # Disk
      dua # disk usage TUI tool. Run: dua i

      # Network
      overskride # bluetooth gui
      bluetui # bluetooth tui
      telegram-desktop

      # Media
      imv # cli image viewer
      paprefs # virtual audio output
      gthumb # image viewer
      ffmpegthumbnailer
      halftone # image pixel redactor
      ffmpeg-full
      helvum # A GTK patchbay for pipewire
      pavucontrol # audio gui control
      alsa-utils # audio volume control (?)
      digikam
      qimgv # img viewer

      # Theming
      vimix-icon-theme # for icons
      qogir-icon-theme # for cursor
      gnome-tweaks
      swaybg # background
      flavours # create base16 colors from image
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
      bitwarden-cli

      # Gaming
      portablemc # minecraft cli launcher
      curseofwar # stategy cli game
      vitetris # tetris cli game
      dwarf-fortress

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
