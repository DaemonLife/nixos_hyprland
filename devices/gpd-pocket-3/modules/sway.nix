{ pkgs, config, lib, ... }: {

  # disable gaps for gpd

  wayland.windowManager.sway = {
    config = rec {
      gaps = {
        outer = lib.mkForce 0;
        inner = lib.mkForce 0;
      };
    };
  };

}
