{ config, lib, ... }: {

  programs.foot = with config.lib.stylix.colors; {
    enable = true;

    settings = {
      main.selection-target = "both"; # copy to foot and system clipboard 

      cursor = {
        beam-thickness = 1.2;
      };

    };
  };
}
