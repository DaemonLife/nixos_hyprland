{ pkgs, config, lib, ... }: {

  services.mako = with config.lib.stylix.colors; {
    borderSize = lib.mkForce 2;
  };
}
