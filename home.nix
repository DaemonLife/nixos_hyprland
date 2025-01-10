{ pkgs, lib, config, inputs, ... }: {

  imports = [ ./modules/import_all.nix ];

  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ./image.jpg;
    # override = {
    #   author = "DaemonLife";
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
    #   base0F = "bdc3c2"; # bright cyan
    # };
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

      # Main
      libnotify # for mako
      grim # screenshot tool
      slurp # screenshot tool
      brightnessctl # screen light
      pavucontrol # audio gui control
      alsa-utils # audio volume control (?)
      gnome-power-manager # power statistic
      hypridle # timer for screen lock
      swaylock # screen lock
      ffmpegthumbnailer
      # ueberzugpp # image preview
      nautilus # file manager
      nautilus-open-any-terminal
      bluetui # bluetooth tui
      tgt # telegram tui
      dua # disk usage TUI tool. Run: dua i
      wl-clipboard
      darktable
      gthumb # image viewer
      overskride # bluetooth gui
      imv # cli image viewer

      # Theming
      vimix-icon-theme # for icons
      qogir-icon-theme # for cursor
      gnome-tweaks
      swaybg # background
      flavours # create base16 colors from image
      unstable.gowall # Tool to convert a Wallpaper's color scheme
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
      stellarium
      dwarf-fortress
      halftone # image pixel redactor
      btop
      cool-retro-term
      unzip
      epy # cli book reader
      jrnl
      yt-dlp
      ffmpeg-full
      transmission_4
      qbittorrent # torrent client
      telegram-desktop
      cmus # player
      python3
      nodejs
      pipx
      tor-browser
      bottles
      veracrypt
      portablemc # minecraft cli launcher
      fastfetch # system info in terminal
      curseofwar # stategy cli game
      vitetris # tetris cli game
      cmatrix # matrix in terminal
      wev # key events in wayland

    ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  # dconf.settings = {
  #   "org/gnome/desktop/peripherals/touchpad" = {
  #     tap-and-drag = false;
  #     speed = -0.8;
  #     natural-scroll = false;
  #     accel-profile = "adaptive";
  #   };
  #   "org/gnome/desktop/peripherals/mouse" = {
  #     speed = -0.3;
  #     natural-scroll = false;
  #     accel-profile = "adaptive";
  #   };
  # };

}
