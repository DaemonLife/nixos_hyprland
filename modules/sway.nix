{ pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    xwayland = true;

    extraConfig = ''
      focus_on_window_activation focus
      titlebar_border_thickness 4
      hide_edge_borders smart_no_gaps
      default_orientation auto
    '';

    config = rec {

      focus = {
        followMouse = "yes";
        mouseWarping = true;
        wrapping = "yes";
      };

      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty --single-instance";
      menu = "${pkgs.fuzzel}/bin/fuzzel -l 10";
      bars = [{ command = "waybar"; }];

      startup = [
        { command = "rfkill block bluetooth"; }
        { command = "autotiling-rs"; }
        { command = "${pkgs.mako}/bin/mako"; }
        { command = "${pkgs.udiskie}/bin/udiskie -a"; }
        { command = "wl-paste -t text --watch clipman store --no-persist"; }
        {
          command = ''
            swayidle -w timeout 540 'swaymsg "output * dpms off"' timeout 600 'swaymsg input "type:keyboard xkb_switch_layout 0" && swaylock' resume 'swaymsg "output * dpms on"'
          '';
        }
      ];

      output = {
        # lenovo
        "BOE 0x0931 Unknown" = {
          mode = "2240x1400@60.002Hz";
          scale = "1.6"; # 2240 -> 1400
          adaptive_sync = "on";
          render_bit_depth = "10"; # 6, 8, 10
          position = "0 0"; # main position
        };
        # monitor gg
        "Acer Technologies Acer A231H LQT0W0084320" = {
          mode = "1920x1080@60Hz";
          scale = "1";
          adaptive_sync = "off";
          render_bit_depth = "8"; # 6, 8, 10
          position = "1400 0"; # to right
        };
        # monitor msk
        "Shenzhen KTC Technology Group H27S17 0x00000001" = {
          mode = "2560x1440@164.998Hz";
          scale = "1.25";
          adaptive_sync = "on";
          render_bit_depth = "10"; # 6, 8, 10
          position = "-2048 0"; # to left
        };

        # gpd
        "DSI-1" = {
          mode = "1200x1920@60.000Hz";
          scale = "1.6"; # 1920 -> 1200px
          adaptive_sync = "on";
          render_bit_depth = "10"; # 6, 8, 10
          position = "0 0"; # main
          transform = "90";
        };
        # TV msk
        "Invalid Vendor Codename - RTK RTK TV 0x01010101" = {
          mode = "3840x2160@60.000Hz";
          scale = "1";
          adaptive_sync = "on";
          render_bit_depth = "10"; # 6, 8, 10
          position = "1200 0"; # to right from gpd
        };

      };

      gaps = {
        outer = 2;
        inner = 5;
        smartGaps = true;
        smartBorders = "on";
      };

      window = {
        border = 4;
        titlebar = false;
      };

      colors = {
        focused = {
          # border = lib.mkForce "#${base0A}";
          indicator = lib.mkForce "#${base0E}";
        };
        focusedInactive = {
          border = lib.mkForce "#${base01}";
          indicator = lib.mkForce "#${base03}";
        };
        unfocused = {
          border = lib.mkForce "#${base01}";
          indicator = lib.mkForce "#${base03}";
        };
        urgent = {
          border = lib.mkForce "#${base01}";
          indicator = lib.mkForce "#${base03}";
        };
        placeholder = {
          border = lib.mkForce "#${base01}";
          indicator = lib.mkForce "#${base03}";
        };
      };

      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:win_space_toggle";
          repeat_delay = "300";
          repeat_rate = "60";
        };

        "type:touchpad" = {
          natural_scroll = "disabled";
          tap = "enabled";
          click_method = "button_areas";
        };
      };

      bindkeysToCode = true;
      keybindings = {

        ##################
        # RUN PROGRAMS 
        ##################

        # start terminal
        "${modifier}+Return" = ''
          exec swaymsg input "type:keyboard" xkb_switch_layout 0 && exec ${terminal}
        '';

        # run menu 
        "${modifier}+a" = ''
          exec swaymsg input "type:keyboard" xkb_switch_layout 0 && exec ${menu}'';

        # run file manager
        "${modifier}+n" = "exec thunar";
        "${modifier}+y" = "exec ${terminal} --hold $HOME/nix/scripts/y.fish";

        # run broswer
        "${modifier}+b" = "exec $BROWSER";
        "${modifier}+Shift+B" =
          "exec proxychains4 $BROWSER --set window.title_format [VPN] {perc}{current_title}{title_sep}qutebrowser";

        # telegram
        # "${modifier}+t" = "exec telegram-desktop";

        # lock screen
        "F10" = "exec swaylock";

        ##################
        # Window control 
        ##################

        # kill active window
        "${modifier}+q" = "kill";
        # fullscreen
        "${modifier}+f" = "fullscreen";
        # Float mode
        "${modifier}+Shift+f" = "floating toggle";

        # Resize mode
        "${modifier}+r" = "mode resize";

        # Layouts
        "${modifier}+x" = "splitv";
        "${modifier}+c" = "splith";
        "${modifier}+e" = "layout toggle splith splitv";
        "${modifier}+t" = "layout toggle tabbed";

        # reload config
        "${modifier}+Shift+r" = "reload";

        # Brightness control
        "XF86MonBrightnessUp" = "exec light -A 5";
        "XF86MonBrightnessDown" = "exec light -U 5";
        "Ctrl+l" = "exec light -A 5";
        "Ctrl+h" = "exec light -U 5";

        # Audio 
        "XF86AudioRaiseVolume" =
          "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" =
          "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "Ctrl+j" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "Ctrl+k" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" =
          "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        # Screenshot
        "${modifier}+Shift+s" = "exec grimblast copysave area";
        "PRINT" = "exec grimblast copysave output";

        # Moving around:
        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";

        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";
        "${modifier}+k" = "focus up";
        "${modifier}+j" = "focus down";

        "${modifier}+Ctrl+Left" = "move left";
        "${modifier}+Ctrl+Right" = "move right";
        "${modifier}+Ctrl+Up" = "move up";
        "${modifier}+Ctrl+Down" = "move down";

        "${modifier}+Ctrl+h" = "move left";
        "${modifier}+Ctrl+l" = "move right";
        "${modifier}+Ctrl+k" = "move up";
        "${modifier}+Ctrl+j" = "move down";

        # Workspaces:
        # Switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        "${modifier}+Shift+Right" = "workspace next";
        "${modifier}+Shift+Left" = "workspace prev";
        "${modifier}+Shift+l" = "workspace next";
        "${modifier}+Shift+h" = "workspace prev";
        "${modifier}+Shift+j" = "workspace next";
        "${modifier}+Shift+k" = "workspace prev";

        # Move focused container to workspace
        "${modifier}+Ctrl+1" = "move container to workspace number 1";
        "${modifier}+Ctrl+2" = "move container to workspace number 2";
        "${modifier}+Ctrl+3" = "move container to workspace number 3";
        "${modifier}+Ctrl+4" = "move container to workspace number 4";
        "${modifier}+Ctrl+5" = "move container to workspace number 5";
        "${modifier}+Ctrl+6" = "move container to workspace number 6";
        "${modifier}+Ctrl+7" = "move container to workspace number 7";
        "${modifier}+Ctrl+8" = "move container to workspace number 8";
        "${modifier}+Ctrl+9" = "move container to workspace number 9";
        "${modifier}+Ctrl+0" = "move container to workspace number 10";

      };

      modes = {
        resize = {
          "h" = "resize grow left 10px";
          "l" = "resize grow right 10px";
          "Shift+h" = "resize grow left -10px";
          "Shift+l" = "resize grow right -10px";

          "j" = "resize grow down 10px";
          "k" = "resize grow up 10px";
          "Shift+j" = "resize grow down -10px";
          "Shift+k" = "resize grow up -10px";

          # Return to normal mode
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };

    };

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export QT_QPA_PLATFORM=wayland
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
    '';

  };

}
