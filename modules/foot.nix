{ config, lib, ... }: {

  programs.foot = with config.lib.stylix.colors; {
    enable = true;

    settings = {

      cursor = lib.mkForce {
        style = "block";
        beam-thickness = 1;
        blink = "yes";
      };

    };
  };
}
