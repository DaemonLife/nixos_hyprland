{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = lib.mkForce 0;
      gaps_out = lib.mkForce "0, 0, 0, 0";
    };
  };
  
}
