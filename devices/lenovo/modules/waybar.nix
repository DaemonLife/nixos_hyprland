{ pkgs, config, lib, ... }: {

  programs.waybar = with config.lib.stylix.colors; {

    # don't works
    style = ''
          /* calendar look */
          tooltip {
            border: 4px;
          }
      	'';
  };
}
