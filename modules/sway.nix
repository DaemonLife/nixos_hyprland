{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty --single-instance";
      startup = [ ];
      gaps.outer = 5;
    };
  };

}
