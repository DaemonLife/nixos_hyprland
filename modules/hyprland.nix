{ pkgs, config, ... }: {

wayland.windowManager.hyprland = {
	enable = true;
	xwayland.enable = true;
};

wayland.windowManager.hyprland.settings = with config.colorScheme.colors; {
	"$mod" = "SUPER";
	"$terminal" = "kitty";
	"$filemanager" = "nautilus";
	"$menu" = "fuzzel";
	"$browser" = "firefox";

	monitor = [
		# Monitor
		",highres,0x0,1.333333,bitdepth,10,vrr,1"
		# Laptop
		"eDP-1,highres,auto-right,1.6,bitdepth,10,vrr,1"
	];
	
	exec-once = [
		"waybar & mako"
		"swayidle -w timeout 300 'swaylock -f -c 000000' timeout 305 'hyprctl dispatch dpms off && hyprctl keyword input:kb_layout us,ru' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -c 000000'"
	];

	env = [
		# "GTK_THEME,Adwaita"
		"GDK_BACKEND,wayland,x11"
		"QT_QPA_PLATFORM,wayland;xcb"
		"SDL_VIDEODRIVER,wayland;"
		"CLUTTER_BACKEND,wayland"
		"QT_QPA_PLATFORMTHEME,qt6ct"
		"XDG_CURRENT_DESKTOP,Hyprland"
		"XDG_SESSION_TYPE,wayland"
		"XDG_SESSION_DESKTOP,Hyprland"
		"QT_AUTO_SCREEN_SCALE_FACTOR,1"
		"QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
		"XCURSOR_THEME,Qogir-dark"
		"XCURSOR_SIZE,24"
		"MOZ_ENABLE_WAYLAND,1"
		"GDK_SCALE,2"
	];

	input = {
		kb_layout = "us,ru";
		kb_variant = "";
		kb_model = "";
		kb_options = "grp:win_space_toggle";
		kb_rules = "";
		accel_profile = "adaptive";
		follow_mouse = 1;

		touchpad = {
			natural_scroll = true;
			disable_while_typing = true;
			scroll_factor = "0.6";
			drag_lock = false;
			tap-and-drag = false;
		};

		sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
	};

	# Example per-device config
	# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
	device = {
		name = "epic-mouse-v1";
		sensitivity = "-0.5";
	};

	general = {
		# See https://wiki.hyprland.org/Configuring/Variables/ for more
		gaps_in = 3;
		gaps_out = "6, 6, 6, 6";
		# gaps_out = "9, 7, 7, 7";
		border_size = 2;
		"col.active_border" = "rgba(${base0D}ff) rgba(${base0B}ff) 45deg";
		"col.inactive_border" = "rgba(${base00}ff)";
		layout = "dwindle";
		# Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false;
	};

	misc = {
		vfr = true;
		disable_hyprland_logo = true;
		disable_splash_rendering = true;
		mouse_move_enables_dpms = true;
		animate_manual_resizes = true;
		mouse_move_focuses_monitor = true;
	};

	# Scale options
	xwayland = {
  		force_zero_scaling = true;
	};

	decoration = {
		rounding = 0;
		active_opacity = 1.0;
		inactive_opacity = 1.0;
		blur = {
			enabled = false;
			size = 6;
			passes = 3;
			new_optimizations = true;
			xray = true;
			ignore_opacity = true;
		};

		drop_shadow = false;
		shadow_ignore_window = true;
		shadow_offset = "1 2";
		shadow_range = 10;
		shadow_render_power = 5;
		# "col.shadow" = "0x66404040";
		# blurls = [
		# 	"gtk-layer-shell"
		# 	waybar
		# 	lockscreen
		# ];
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
		# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true; # you probably want this
		# smart_split = true
		no_gaps_when_only = 1;
	};

	master = {
		# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
		new_is_master = true;
	};

	gestures = {
		# See https://wiki.hyprland.org/Configuring/Variables/ for more
		workspace_swipe = true;
	};

	bindm = [
		# Window mouse control
		"$mod, mouse:272, movewindow"
		"$mod, mouse:273, resizewindow"
		"$mod ALT, mouse:272, resizewindow"
	];

	bind = [
		# Run programs
		"$mod, RETURN, exec, $terminal"
		"$mod, RETURN, exec, hyprctl keyword input:kb_layout us,ru"
		"$mod, D, exec, $menu"
		"$mod, D, exec, hyprctl keyword input:kb_layout us,ru"
		"$mod, N, exec, $filemanager"
		"$mod, B, exec, $browser"
		"$mod, T, exec, telegram-desktop"

		# Windows control
		"$mod, Q, killactive"
		"$mod, O, exit"
		"$mod, V, togglefloating"
		"$mod, P, pseudo"
		"$mod, s, togglesplit"
		"$mod, g, togglegroup"
		"$mod, tab, changegroupactive"
		"$mod, F, fullscreen"
		# Move focus
		"$mod, left, movefocus, l"
		"$mod, right, movefocus, r"
		"$mod, up, movefocus, u"
		"$mod, down, movefocus, d"
		# Move window
		"$mod SHIFT, left, movewindow, l"
		"$mod SHIFT, right, movewindow, r"
		"$mod SHIFT, up, movewindow, u"
		"$mod SHIFT, down, movewindow, d"

		# Lock screen
		"$mod, l, exec, swaylock -f -c 000000"
		"$mod, l, exec, hyprctl keyword input:kb_layout us,ru"

		# Screenshot
		",PRINT, exec, grim ~/Pictures/ps_$(date +\"%Y%m%d%H%M%S\").png - | wl-copy"
		"SUPER_SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

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


	]
	++ (
	# workspaces
	# binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
	builtins.concatLists (builtins.genList (
	    x: let
	      ws = let
		c = (x + 1) / 10;
	      in
		builtins.toString (x + 1 - (c * 10));
	    in [
	      "$mod, ${ws}, workspace, ${toString (x + 1)}"
	      "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	    ]
	  )
	  10)
	);


	};
}
