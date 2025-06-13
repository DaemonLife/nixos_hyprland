{ pkgs, config, lib, ... }: {
  # lenovo output

  wayland.windowManager.sway = {

    config = rec {

      output = {
        # lenovo laptop
        "BOE 0x0931 Unknown" = {
          mode = "2240x1400@60.002Hz";
          scale = "2"; # 2240 -> 1400
          adaptive_sync = "enable";
          render_bit_depth = "10"; # 6, 8, 10
          position = "2560 0"; # laptop position for msk
        };
        # monitor gg
        "Acer Technologies Acer A231H LQT0W0084320" = {
          mode = "1920x1080@60Hz";
          scale = "0.8";
          adaptive_sync = "enable";
          render_bit_depth = "8"; # 6, 8, 10
          position = "3840 0"; # right position (1400+2048?)
        };
        # monitor msk
        "Shenzhen KTC Technology Group H27S17 0x00000001" = {
          mode = "2560x1440@164.998Hz";
          scale = "1";
          adaptive_sync = "false";
          render_bit_depth = "10"; # 6, 8, 10
          position = "0 0"; # left position 
        };
      };

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "eDP-1";
        }
        {
          workspace = "2";
          output = [ "DP-1" "HDMI-A-1" ];
        }
        {
          workspace = "3";
          output = [ "DP-1" "HDMI-A-1" ];
        }
        {
          workspace = "4";
          output = [ "DP-1" "HDMI-A-1" ];
        }
        {
          workspace = "5";
          output = [ "DP-1" "HDMI-A-1" ];
        }
      ];


    }; # config

  };
}
