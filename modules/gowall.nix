{ config, ... }: {

  home.file.".config/gowall/config.yml".text =
    with config.lib.stylix.colors; ''
themes:
  - name: "global"
    colors:
      - "#${base00}"
      - "#${base01}"
      - "#${base02}"
      - "#${base03}"
      - "#${base04}"
      - "#${base05}"
      - "#${base06}"
      - "#${base07}"
      - "#${base08}"
      - "#${base09}"
      - "#${base0A}"
      - "#${base0B}"
      - "#${base0C}"
      - "#${base0D}"
      - "#${base0E}"
      - "#${base0F}"
'';

  }
