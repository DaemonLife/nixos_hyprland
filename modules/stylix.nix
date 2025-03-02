{ pkgs, config, ... }: {

  stylix = {
    enable = true;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ../images/image.jpg;
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
        name = "GeistMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "GeistMono Nerd Font Mono";
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

}
