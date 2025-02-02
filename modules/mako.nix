{ pkgs, config, ... }: {

  services.mako = with config.lib.stylix.colors; {
    enable = true;
    layer = "overlay";
    anchor = "bottom-right";
    width = 350;
    icons = false;
    margin = "0,0,0,0";
    padding = "10,10,10,10";
    borderSize = 2;
    borderRadius = 0;
    defaultTimeout = 12000;
    groupBy = "summary";
    # font = "JetBrains Mono Regular";
    format = "<b>%s</b>\\n%b";
  };
}
