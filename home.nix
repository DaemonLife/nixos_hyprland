{ pkgs, lib, config, inputs, ... }: {

  imports = [
    ./modules/import_all.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
    override = {
      author = "DaemonLife";
      # base00 = "000000";
      # base01 = "121212";
      # base02 = "000000";
      # base03 = "000000";
      # base04 = "000000";
      # base05 = "000000";
      # base06 = "000000";
      # base07 = "000000";
      # base08 = "443732";
      # base09 = "ad875b";
      # base0A = "fadcc9";
      # base0B = "73cf98";
      # base0C = "56a4a5";
      # base0D = "05677c";
      # base0E = "c24149";
      # base0F = "8f2115";
    };
    # image = ./image.jpg;
    image = config.lib.stylix.pixel "base00";
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
      alacritty # terminal
      fuzzel # run menu
      mako # notification agent
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
      ueberzugpp # image preview
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
      halftone # image pixel redactor
      btop
      cool-retro-term
      unzip
      epy # cli book reader
      jrnl
      mpv
      ffmpeg-full
      transmission_4
      qbittorrent # torrent client
      telegram-desktop
      cmus # player
      python3
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
