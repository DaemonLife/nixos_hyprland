{ pkgs, config, ... }: {

  services.mako = with config.lib.stylix.colors; {
    enable = true;
    # backgroundColor = "#${base00}";
    # borderColor = "#${base0D}";
    # textColor = "#${base05}";
    layer = "overlay";
    anchor = "bottom-right";
    width = 350;
    margin = "0,4,4,0";
    padding = "10,10,10,10";
    borderSize = 2;
    borderRadius = 0;
    defaultTimeout = 10000;
    groupBy = "summary";
    # font = "JetBrains Mono Regular";
    format = "<b>%s</b>\\n%b";
  };
}
