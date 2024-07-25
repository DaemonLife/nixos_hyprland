{ pkgs, config, ... }: {

programs.waybar = with config.colorScheme.palette; {
	enable = true;

	# Bug fix for nixos and hyprland
	package = pkgs.waybar.overrideAttrs (oldAttrs: {
		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	});

	settings = {
		mainBar = {
			layer = "top";
			position = "top";
			height = 24;
			modules-left = [ "hyprland/workspaces" ];
			modules-center = [ "hyprland/window" ];
			modules-right = [
				"tray"
				"hyprland/language"
				"network"
				"bluetooth"
				"idle_inhibitor"
				"pulseaudio"
				"battery"
				"clock"
			];

			"hyprland/workspaces" = {
				window-rewrite = {};
				on-click = "activate";
				disable-scroll = true;
				all-outputs = false;
				format = "{icon}";
				persistent-workspaces = {
					"eDP-1" = 1;
					"2" = 2;
				};
				format-icons = {
					"eDP-1" = 1;
					"2" = 2;
					"3" = 3;
					"4" = 4;
					"5" = 5;
					"6" = 6;
					"7" = 7;
					"8" = 8;
					"9" = 9;
					"10" = 10;
				};

			};

			"hyprland/window" = {
				max-length = 40;
				separate-outputs = true;
			};

			tray.spacing = 10;

			# Modules
			idle_inhibitor = {
				format = "{icon}";
				format-icons = {
					activated = "idle";
					deactivated = "idle";
				};
			};

			bluetooth = {
				format = "{icon}";
				format-alt = "{icon}";
				interval = 30;
				format-icons = {
					enabled = "bt";
					disabled = "bt";
				};
				tooltip-format = "{}";
				on-click = "rfkill toggle bluetooth";
			};

			"hyprland/language" = {
				format = "{}";
				format-en = "us";
				format-ru = "ru";
			};

			clock = {
				format = "{:%y/%m/%d %H:%M}";
				on-click = "exec gnome-calendar";
			};

			battery = {
				states = {
					full = 98;
					good = 90;
					warning = 40;
					critical = 20;
				};
				interval = 30;
				format = "bat: {capacity}";
				format-charging = "bat: {capacity}ϟ";
				format-plugged = "bat: {capacity}";
				on-click = "gnome-power-statistics";
			};

			network = {
				format-disabled = "wifi";
				format-wifi = "wifi";
				format-ethernet = " {ipaddr}/{cidr}";
				format-linked = " (No IP)";
				format-disconnected = "wifi";
				on-click-right = "kitty --hold sh -c \"nmcli dev wifi rescan && nmtui\"";
				on-click = "rfkill toggle wifi";
			};

			pulseaudio = {
				format = "{icon} {format_source}";
				format-bluetooth = "{icon} {volume} {format_source}";
				format-bluetooth-muted = "   {volume} {format_source}";
				format-muted = "vol: ......";
				format-source = "mic";
				format-source-muted = "";
				format-icons = {
					hands-free = " ";
					headset = " ";
					phone = " ";
					portable = " ";
					car = " ";
					speaker = ["speaker: ......" "speaker: ı....." "speaker: l....." "speaker: lı...." "speaker: ll...." "speaker: llı..." "speaker: lll..." "speaker: lllı.." "speaker: llll.." "speaker: llllı." "speaker: lllll." "speaker: lllllı" "speaker: llllll"];
					default = ["volume: ......" "volume: ı....." "volume: l....." "volume: lı...." "volume: ll...." "volume: llı..." "volume: lll..." "volume: lllı.." "volume: llll.." "volume: llllı." "volume: lllll." "volume: lllllı" "volume: llllll"];
					hdmi = ["hdmi: ......" "hdmi: ı....." "hdmi: l....." "hdmi: lı...." "hdmi: ll...." "hdmi: llı..." "hdmi: lll..." "hdmi: lllı.." "hdmi: llll.." "hdmi: llllı." "hdmi: lllll." "hdmi: lllllı" "hdmi: llllll"];
					headphone = ["headset: ......" "headset: ı....." "headset: l....." "headset: lı...." "headset: ll...." "headset: llı..." "headset: lll..." "headset: lllı.." "headset: llll.." "headset: llllı." "headset: lllll." "headset: lllllı" "headset: llllll"];
				};
				max-volume = 100;
				tooltip-format = "{desc}, {volume}%";
				on-click = "pavucontrol";
				on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
				on-click-middle = "pavucontrol";
                scroll-step = 3;
			};

		};

	};

	style = 
	''
	@define-color dark #${base00};
	@define-color gray #${base02};
	@define-color white #${base05};
	@define-color accent #${base0D};
	@define-color green #${base0B};
	@define-color red #${base08};
	@define-color magenta #${base0E};
	
	/* Default setting for all modules */
	* {
	    border: none;
        border-radius: 0px;
        margin: 0px;
	    font-family: "Jetbrains Mono Regular";
	    font-size: 14px;
	    font-weight: bold;
	}

    /* Default color for modules except workspaces button.active */
    #workspaces button, #window, window#waybar, #tray, #language, #network, #bluetooth, #idle_inhibitor, #pulseaudio, #battery, #clock { background-color: @darl; color: @white; }

	/* Default padding for some modules */
	#language, #idle_inhibitor, #network, #battery, #clock, #tray, #bluetooth, #pulseaudio { padding: 0px 0px 0px 10px; }
    
    #workspaces button { padding: 0px 5px 0px 5px; }
    #clock { padding-right: 8px; }
    #battery { padding-left: 6px; }
    #window { padding: 0px 10px 0px 10px; }

    #workspaces button.active { 
        color: @dark;
        background-color: @accent;
    }

	#network.disconnected { color: @red;}
	#network.disabled { color: @gray; }

	#idle_inhibitor.activated { color: @green; }
	#idle_inhibitor.deactivated { color: @gray; }

	#bluetooth { color: @green; }
	#bluetooth.disabled { color: @gray; }

	#pulseaudio.muted { color: @gray; }

	#battery:not(.charging) { color: @white; }
	#battery.charging{
	    color: @green;
	    animation-name: blink;
	    animation-duration: 1.5s;
	    animation-timing-function: linear;
	    animation-iteration-count: infinite;
	    animation-direction: alternate;
	} 
	#battery.warning:not(.charging) {
	    color: @red;
	    animation-name: blink;
	    animation-duration: 0.5s;
	    animation-timing-function: linear;
	    animation-iteration-count: infinite;
	    animation-direction: alternate;
	}
	#battery.plugged { color: @green; }
	@keyframes blink { to { color: @white; } }
	'';
};
}
