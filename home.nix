{ pkgs, lib, config, inputs, ... }: {

  imports = [
    ./modules/mako.nix
    ./modules/fuzzel.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
    #./modules/gtk.nix
    ./modules/waybar.nix
    ./modules/firefox.nix
    ./modules/mpv.nix
    ./modules/hypridle.nix
    ./modules/swaylock.nix
    ./modules/telegram-theme.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/cmus.nix
    ./modules/jrnl.nix
    ./modules/helix.nix
    ./modules/nixvim.nix
    ./modules/ranger.nix
  ];

  stylix = {
    enable = true;
    base16Scheme =
      # "${pkgs.base16-schemes}/share/themes/mountain.yaml";
      "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    # override = {
    #   author = "DaemonLife";
    #   base00 = "000000";
    #   base01 = "000000";
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
    # };
    image = ./image.jpg;

    targets.waybar.enable = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 12;
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
      # -----------------------------------------------------------------------
      # For Hyprland
      # -----------------------------------------------------------------------
      kitty
      fuzzel # run menu
      mako # notification agent
      libnotify # for mako
      grim slurp # screenshot tool
      brightnessctl # screen light
      pavucontrol # audio gui control
      alsa-utils # audio volume control (?)
      gnome.gnome-power-manager # power statistic
      hypridle
      swaylock # screen lock

      # Theming
      vimix-icon-theme # for icons
      qogir-icon-theme # for cursor
      gnome.gnome-tweaks
      swaybg # background
      flavours # create base16 colors from image
      dconf

      # Fonts
      font-awesome
      fira
      cantarell-fonts

      # -----------------------------------------------------------------------
      # Other
      # -----------------------------------------------------------------------
      gimp
      btop
      libreoffice-fresh
      # nautilus-open-in-blackbox # right click open menu
      unzip
      jrnl
      mpv
      ffmpeg-full
      transmission_4-gtk qbittorrent # torrent client
      telegram-desktop
      cmus # player
      python3
      pipx
      tor-browser
      bottles
      veracrypt
      portablemc # minecraft cli launcher 
      fastfetch # system info in terminal
      curseofwar # cli game

    ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  qt = {
    enable = true;
  };

}
