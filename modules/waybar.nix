{ pkgs, config, lib, ... }: {

  programs.waybar = with config.lib.stylix.colors; {
    enable = true;

    # Bug fix for nixos and hyprland
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24; # 25 is correct for my windows border size
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
          window-rewrite = { };
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
          max-length = 28;
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
          # on-click = "rfkill toggle bluetooth";
          on-click = "rfkill unblock bluetooth && overskride";
          on-click-right = "rfkill block bluetooth";
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "us";
          format-ru = "ru";
        };

        clock = {
          # format = "{:%y/%m/%d %H:%M}";
          format = "{:%H:%M}";
          on-click = "exec gnome-calendar";
          "tooltip-format" = "<span size='10pt' font='GeistMono Nerd Font Mono'>{calendar}</span>";
          "calendar" = {
            "mode"          = "year";
            "mode-mon-col"  = 3;
            # "weeks-pos"     = "right";
            "on-scroll"     = 1;
            "on-click-right"= "mode";
            "format" = {
              "months"=     "<span color='#${base0A}'><b>{}</b></span>";
              "days"=       "<span color='#${base07}'><b>{}</b></span>";
              "weeks"=      "<span color='#${base0C}'><b>W{}</b></span>";
              "weekdays"=   "<span color='#${base0B}'><b>{}</b></span>";
              "today"=      "<span color='#${base08}'><b><u>{}</u></b></span>";
            };
          };
          "actions"= {
            "on-click-right"= "mode";
            "on-click-forward"= "tz_down";
            "on-click-backward"= "tz_up";
            "on-scroll-up"= "shift_down";
            "on-scroll-down"= "shift_up";
        };

        };

        battery = {
          states = {
            full = 98;
            good = 90;
            warning = 35;
            critical = 20;
          };
          interval = 30;
          # bat({capacity}) format?
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
          on-click = ''rfkill unblock wifi && kitty --hold sh -c "nmcli dev wifi rescan && nmtui"'';
          on-click-right = "rfkill block wifi";
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
            speaker = [
              "speaker: ......"
              "speaker: ı....."
              "speaker: l....."
              "speaker: lı...."
              "speaker: ll...."
              "speaker: llı..."
              "speaker: lll..."
              "speaker: lllı.."
              "speaker: llll.."
              "speaker: llllı."
              "speaker: lllll."
              "speaker: lllllı"
              "speaker: llllll"
            ];
            default = [
              "volume: ......"
              "volume: ı....."
              "volume: l....."
              "volume: lı...."
              "volume: ll...."
              "volume: llı..."
              "volume: lll..."
              "volume: lllı.."
              "volume: llll.."
              "volume: llllı."
              "volume: lllll."
              "volume: lllllı"
              "volume: llllll"
            ];
            hdmi = [
              "hdmi: ......"
              "hdmi: ı....."
              "hdmi: l....."
              "hdmi: lı...."
              "hdmi: ll...."
              "hdmi: llı..."
              "hdmi: lll..."
              "hdmi: lllı.."
              "hdmi: llll.."
              "hdmi: llllı."
              "hdmi: lllll."
              "hdmi: lllllı"
              "hdmi: llllll"
            ];
            headphone = [
              "headset: ......"
              "headset: ı....."
              "headset: l....."
              "headset: lı...."
              "headset: ll...."
              "headset: llı..."
              "headset: lll..."
              "headset: lllı.."
              "headset: llll.."
              "headset: llllı."
              "headset: lllll."
              "headset: lllllı"
              "headset: llllll"
            ];
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

    style = ''
      	@define-color dark #${base00};
      	@define-color gray #${base03};
      	@define-color white #${base05};
      	@define-color accent #${base0D};
      	@define-color green #${base0B};
      	@define-color red #${base08};
      	@define-color magenta #${base0E};
      	@define-color yellow #${base0A};
      	
      	/* Default setting for all modules */
      	* {
      	  border: 0px;
          border-radius: 0px;
          margin: 0px;
          padding: 0px;
          text-decoration: none;
      	  font-family: "GeistMono";
          font-weight: normal;
          font-size: 14px;
      	}

          /* Default color for modules except workspaces button.active */
          #workspaces button, #window, window#waybar, #tray, #language, #network, #bluetooth, #idle_inhibitor, #battery, #pulseaudio, #clock { color: @white; }

      	/* Default padding for some modules */
      	#language, #idle_inhibitor, #network, #clock, #tray, #bluetooth, #pulseaudio { padding: 0px 0px 0px 10px; }
          
          #workspaces button { 
            padding: 0px 5px 0px 5px;
          }
          #clock { padding-right: 6px; }
          #battery { padding-left: 6px; }
          #window { padding: 0px 15px 0px 15px; }

          #workspaces button.active { 
              color: @dark;
              background-color: @accent;
          }

        window#waybar.empty {
          background-color: transparent;
        }
        window#waybar {
          background-color: @dark;
        }

        /* calendar look */
        tooltip {
          background-color: #${base01};
          border: 2px;
          border-style: solid;
          border-color: @accent;
        }

      	#network.disconnected { color: @red;}
      	#network.disabled { color: @gray; }

      	#idle_inhibitor.activated { color: @green; }
      	#idle_inhibitor.deactivated { color: @gray; }

      	#bluetooth { color: @green; }
      	#bluetooth.disabled { color: @gray; }

      	#pulseaudio.muted { color: @gray; }

      	#battery.plugged { color: @green; }
      	#battery.charging{
      	    color: @green;
      	    animation-name: blink;
      	    animation-duration: 1.5s;
      	    animation-timing-function: linear;
      	    animation-iteration-count: infinite;
      	    animation-direction: alternate;
      	} 
      	#battery.warning:not(.charging) { color: @yellow; }
      	#battery.critical:not(.charging) { color: @red; }
      	@keyframes blink { to { color: @yellow; } }
      	'';
  };
}
