{ pkgs, config, lib, ... }: {
  programs.eww = with config.lib.stylix.colors; {
    enable = true;
    configDir = ".";
  };
}
