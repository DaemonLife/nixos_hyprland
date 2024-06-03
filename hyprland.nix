{
wayland.windowManager.hyprland = {
	enable = true;
	xwayland.enable = true;
};

wayland.windowManager.hyprland.settings = {
	"$mod" = "SUPER";

	monitor = [
		",highres,0x0,1.333333,bitdepth,10,vrr,1"
		"eDP-1,highres,1920x0,1.6,bitdepth,10,vrr,1"
	];
	
	exec-once = [
		"waybar & mako"
		"swayidle -w timeout 300 'swaylock -f -c 000000' timeout 305 'hyprctl dispatch dpms off && hyprctl keyword input:kb_layout us,ru' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -c 000000'"
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
		gaps_in = 5;
		gaps_out = "9, 7, 7, 7";
		border_size = 1;
		# col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
		"col.active_border" = "rgba(3584e4ee) rgba(c3e88dee) 90deg";
		"col.inactive_border" = "rgba(1e1e1eff)";
		# col.inactive_border = rgba(595959aa)
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
	# toolkit-specific scale
	env = [
		"GDK_SCALE,2"
		"XCURSOR_SIZE,32"
	];

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
		"col.shadow" = "0x66404040";
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

	bind = [
		"$mod, F, exec, firefox"
		", Print, exec, grimblast copy area"
		"$mod, RETURN, exec, kitty"

		"$mod, Q, killactive"
		"$mod, O, exit"
		"$mod, D, exec, fuzzel"
		"$mod, l, exec, swaylock -f -c 000000"
		"$mod, l, exec, hyprctl keyword input:kb_layout us,ru"
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
