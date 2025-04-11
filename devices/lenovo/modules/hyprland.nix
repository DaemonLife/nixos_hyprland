{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = lib.mkForce 3;
      gaps_out = lib.mkForce "6, 6, 6, 6";
    };

    input = {
      sensitivity = lib.mkForce "0"; # -1.0 - 1.0
      scroll_factor = lib.mkForce "1.0";
    };
  };

}
