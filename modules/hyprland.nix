{ inputs, pkgs, config, lib, ... }:
with config.lib.stylix.colors; {

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "nautilus";
    "$menu" = "fuzzel -l 8 --show-actions --counter";
    "$browser" = "qutebrowser";

    monitor = [
      # Monitor msk
      "desc:Shenzhen KTC Technology Group H27S17 0x00000001,highres,0x0,1,bitdepth,10,vrr,1"
      # Monitor gg
      "desc:Acer Technologies Acer A231H LQT0W0084320,highres,auto-right,1,bitdepth,10,vrr,1"
      # GPD3
      "DSI-1,preferred,auto,2,transform,3"
      # Lenovo
      "eDP-1,highres,auto,1.6,bitdepth,10,vrr,1,mirror,desc:LG Electronics LG TV 0x01010101"
      # Random monitor
      ",preferred,auto,1"
    ];

    exec-once = [
      "waybar"
      "mako"
      "rfkill block bluetooth" # disable bluetooth autostart
      "/run/current-system/sw/libexex/polkit-gnome-authentication-agent-1"
      "hypridle"
      # "swaybg -i /home/user/nix/image.jpg"

    ];

    exec = [
      # maze generator
      "bash $HOME/nix/scripts/maze/run.sh ${base00} ${base03}"
      "swaybg -i $HOME/nix/scripts/maze/maze.png"
    ];

    env = [
      "GDK_BACKEND,wayland,x11,*"
      "SDL_VIDEODRIVER,wayland;"
      "CLUTTER_BACKEND,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORM,wayland"
      "QT_STYLE_OVERRIDE,Breeze-Dark"
      # "MOZ_ENABLE_WAYLAND,1"
      "XCURSOR_SIZE,24"
      "XCURSOR_THEME,Bibata-Modern-Ice"
      "HYPRCURSOR_THEME,Bibata-Modern-Ice"
      "HYPRCURSOR_SIZE,24"
      "GDK_DPI_SCALE,1"
      "GDK_SCALE,1"
    ];

    input = {

      kb_layout = "us,ru";
      kb_options = "grp:win_space_toggle";
      accel_profile = "adaptive";
      force_no_accel = false;
      follow_mouse = 1; # window focus
      natural_scroll = false; # natural mean idiotic

      sensitivity = -0.2; # -1.0 - 1.0
      scroll_factor = "0.5";

      touchpad = {
        disable_while_typing = true;
        tap-and-drag = false;
        drag_lock = false;
      };

    };

    general = {
      border_size = 4;
      extend_border_grab_area = 25;
      "col.active_border" = lib.mkForce "rgba(${base0D}ff)";
      "col.inactive_border" = lib.mkForce "rgba(${base00}ff)";
      layout = "dwindle";
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
    };

    misc = {
      vfr = true; # always true!
      vrr = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
      animate_manual_resizes = true;
      mouse_move_focuses_monitor = true;
      initial_workspace_tracking = 1;
    };

    # Scale options
    xwayland = { force_zero_scaling = true; };

    decoration = {
      rounding = 0;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      blur.enabled = false;
      shadow.enabled = false;
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true; # you probably want this
      smart_split = false;
    };

    master = { };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 200;
      workspace_swipe_cancel_ratio = "0.05";
    };

    bindm = [
      # Window mouse control
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, ALT_L, resizewindow"
      # "$mod ALT, mouse:272, resizewindow"
    ];

    bind = [
      # Run programs
      "$mod, RETURN, exec, $terminal"
      "$mod, RETURN, exec, hyprctl keyword input:kb_layout us,ru"
      "$mod, D, exec, $menu"
      "$mod, D, exec, hyprctl keyword input:kb_layout us,ru"
      "$mod, N, exec, $filemanager"
      "$mod, B, exec, $browser"
      "$mod SHIFT, B, exec, proxychains4 $browser --set window.title_format [VPN]\\ {perc}{current_title}{title_sep}qutebrowser"
      "$mod, T, exec, telegram-desktop"
      # "$mod, O, exit"

      # Windows control
      "$mod, Q, killactive"
      "$mod, V, togglefloating"
      # "$mod, P, pseudo"
      "$mod, s, togglesplit"
      # "$mod, g, togglegroup"
      # "$mod, tab, changegroupactive"
      "$mod, F, fullscreen"
      "$mod, Tab, cyclenext"
      "$mod, Tab, bringactivetotop"

      # Move focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # Move window
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"

      # Workspace
      "SHIFT Alt_L, RIGHT, workspace, +1"
      "SHIFT Alt_L, LEFT, workspace, -1"
      "SHIFT Alt_L, l, workspace, +1"
      "SHIFT Alt_L, h, workspace, -1"
      "SHIFT Alt_L, j, workspace, +1"
      "SHIFT Alt_L, k, workspace, -1"
      "SHIFT Alt_L, mouse_up, workspace, +1"
      "SHIFT Alt_L, mouse_down, workspace, -1"

      # Lock screen
      ", F10, exec, swaylock"
      ", F10, exec, hyprctl keyword input:kb_layout us,ru"

      # Screenshot
      ''
        ,PRINT, exec, grim ~/Pictures/ps_$(date +"%Y%m%d%H%M%S").png - | wl-copy''
      ''SUPER_SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy''

      # Brightness
      ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      "$mod, XF86MonBrightnessUp, exec, brightnessctl set 2%+"
      "$mod, XF86MonBrightnessDown, exec, brightnessctl set 2%-"

      # Audio control
      ", XF86AudioRaiseVolume, exec, amixer sset 'Master' 5%+"
      ", XF86AudioLowerVolume, exec, amixer sset 'Master' 5%-"
      ", XF86AudioMute, exec, amixer set Master toggle"
      ", XF86AudioMicMute, exec, amixer sset Capture toggle"

      # Run scripts
      "WIN, F1, exec, ~/nix/scripts/save_mode.sh"
    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
        ]) 10));

  };
}
