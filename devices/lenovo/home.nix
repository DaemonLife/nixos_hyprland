{ pkgs, lib, config, inputs, ... }: {

  imports = [ ./modules/import_all.nix ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = { speed = 0.8; };
  };
}
