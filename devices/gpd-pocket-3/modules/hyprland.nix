{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hyprgrass
  ];

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = lib.mkForce 0;
      gaps_out = lib.mkForce "0, 0, 0, 0";
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_cancel_ratio = 0.05;
    };

    plugin = {
      touch_gestures = {
        sensitivity = 4.0;
        long_press_delay = 170;
        edge_margin = 500;
      };
    };

  };
  
}
