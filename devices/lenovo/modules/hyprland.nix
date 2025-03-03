{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = lib.mkForce 4;
      gaps_out = lib.mkForce "6, 6, 6, 6";
    };

    input = { scroll_factor = lib.mkForce "1.0"; };

  };

}
