{ pkgs, config, lib, ... }: {

  programs.yazi = with config.lib.stylix.colors; {
    enable = true;
    enableFishIntegration = true;

  };
}
