{ inputs, pkgs, config, lib, ... }:
let
  execPref = "uwsm app -- ";
  # execPref = ""; # if you don't use UWSM
in {

  xdg.configFile."uwsm/env".text = ''
    export XDG_SESSION_TYPE=wayland

    export CLUTTER_BACKEND=wayland

    # can be some errors with dwarffortress it use x11
    export SDL_VIDEODRIVER=wayland 

    export GDK_BACKEND=wayland,x11,*
    export GDK_DPI_SCALE=1
    export GDK_SCALE=1

    export QT_QPA_PLATFORM=wayland;xcb
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_QPA_PLATFORMTHEME=qt6ct

    export _JAVA_AWT_WM_NONREPARENTING=1
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_USE_XINPUT2=1

    export TERMINAL=kitty

    export XCURSOR_SIZE=24
    export XCURSOR_THEME=Bibata-Modern-Ice

    export NIXOS_OZONE_WL=1
  '';

  xdg.configFile."uwsm/env-hyprland".text = ''
    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_DESKTOP=Hyprland
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = pkgs.unstable.hyprland;
    systemd.enable = false;
  };

  wayland.windowManager.hyprland.settings = with config.lib.stylix.colors; {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    # "$filemanager" = "nautilus -w";
    "$filemanager" = "thunar";
    "$menu" = "fuzzel -l 8";
    "$browser" = "qutebrowser";

    monitor = [
      # Monitor msk
      "desc:Shenzhen KTC Technology Group H27S17 0x00000001,highres,0x0,1.25,bitdepth,10,vrr,1"
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
      "${execPref}dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "${execPref}rfkill block bluetooth" # disable bluetooth autostart
      "${execPref}waybar"
      "${execPref}mako"
      "${execPref}/run/current-system/sw/libexex/polkit-gnome-authentication-agent-1"
      # "bash ../scripts/sleep.sh"
      "${execPref}swayidle -w timeout 600 'hyprctl keyword input:kb_layout us,ru && swaylock -f' timeout 630 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f'"
    ];

    exec = [
      # wallpaper
      "${execPref}swaybg -i $HOME/nix/images/image.jpg"

      # maze generator
      # "bash $HOME/nix/scripts/maze/run.sh ${base00} ${base02}"
      # "swaybg -i $HOME/nix/scripts/maze/maze.png"
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

    cursor = {
      # default_monitor = "";
    };

    # for hyprland v.47
    # ecosystem = {
    #   no_update_news = true;
    #   no_donation_nag = true;
    # };

    general = {
      border_size = 4;
      extend_border_grab_area = 25;
      "col.active_border" = lib.mkForce "rgba(${base0D}ff)";
      "col.inactive_border" = lib.mkForce "rgba(${base02}ff)";
      layout = "dwindle";
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
    };

    # disable borders if one window 
    workspace = [ "w[tv1], gapsout:0, gapsin:0" "f[1], gapsout:0, gapsin:0" ];
    windowrulev2 = [
      "bordersize 0, floating:0, onworkspace:w[tv1]"
      "rounding 0, floating:0, onworkspace:w[tv1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"
    ];

    misc = {
      vfr = true; # always true!
      vrr = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      animate_manual_resizes = true;
      # animate_mouse_windowdragging = true; # need test this
      mouse_move_focuses_monitor = true;
      initial_workspace_tracking = 1;
      disable_autoreload = true; # for save battery

      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
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

    bindl = [
      ",switch:on:Lid Switch, exec, ${execPref}hyprctl dispatch dpms off && swaylock"
      ",switch:off:Lid Switch, exec, ${execPref}hyprctl dispatch dpms on"
    ];

    # for long pressed
    binde = [
      # window resize
      "$mod SHIFT, l, resizeactive, 10 0"
      "$mod SHIFT, h, resizeactive, -10 0"
      "$mod SHIFT, k, resizeactive, 0 -10"
      "$mod SHIFT, j, resizeactive, 0 10"

      # Brightness
      ", XF86MonBrightnessUp, exec, ${execPref}brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, ${execPref}brightnessctl set 5%-"
      "Control_L, h, exec, ${execPref}brightnessctl set 5%-"
      "Control_L, l, exec, ${execPref}brightnessctl set 5%+"

      # Audio control
      ", XF86AudioRaiseVolume, exec, ${execPref}amixer sset 'Master' 5%+"
      ", XF86AudioLowerVolume, exec, ${execPref}amixer sset 'Master' 5%-"
      "Control_L, j, exec, ${execPref}amixer sset 'Master' 5%+"
      "Control_L, k, exec, ${execPref}amixer sset 'Master' 5%-"
      ", XF86AudioMute, exec, ${execPref}amixer set Master toggle"
      ", XF86AudioMicMute, exec, ${execPref}amixer sset Capture toggle"
    ];

    # for one press
    bind = [
      # Run programs
      "$mod, RETURN, exec, ${execPref}$terminal"
      "$mod, RETURN, exec, ${execPref}hyprctl keyword input:kb_layout us,ru"
      "$mod, D, exec, ${execPref}$menu"
      "$mod, D, exec, ${execPref}hyprctl keyword input:kb_layout us,ru"
      "$mod, N, exec, ${execPref}$filemanager"
      "$mod, y, exec, ${execPref}kitty --hold $HOME/nix/scripts/y.fish"
      "$mod, B, exec, ${execPref}$browser"
      "$mod SHIFT, B, exec, ${execPref}proxychains4 $browser --set window.title_format [VPN]\\ {perc}{current_title}{title_sep}qutebrowser"
      "$mod, T, exec, ${execPref}materialgram"
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
      "$mod Control_L, left, movewindow, l"
      "$mod Control_L, right, movewindow, r"
      "$mod Control_L, up, movewindow, u"
      "$mod Control_L, down, movewindow, d"
      "$mod Control_L, h, movewindow, l"
      "$mod Control_L, l, movewindow, r"
      "$mod Control_L, k, movewindow, u"
      "$mod Control_L, j, movewindow, d"

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
      ", F10, exec, ${execPref}swaylock"
      ", F10, exec, ${execPref}hyprctl keyword input:kb_layout us,ru"

      # Screenshot
      "SUPER_SHIFT, s, exec, ${execPref}grimblast copysave area"
      " , PRINT, exec, ${execPref}grimblast copysave output"

    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod Control_L, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
        ]) 10));

  };
}
