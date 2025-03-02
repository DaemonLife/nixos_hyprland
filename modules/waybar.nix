{ pkgs, config, lib, ... }:
lib.mkForce {

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
        height = 24;
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ ];
        modules-right = [
          "tray"
          "hyprland/language"
          "network"
          "bluetooth"
          "idle_inhibitor"
          "battery"
          "pulseaudio"
          "clock#date"
          "clock#time"
        ];

        "hyprland/workspaces" = {
          window-rewrite = { };
          on-click = "activate";
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          persistent-workspaces = {
            "*" = 4; # monitor name and num of workspaces
          };
          format-icons = {
            "1" = 1; # workspace id and icon format
            "2" = 2;
            "3" = 3;
            "4" = 4;
            "5" = 5;
            "6" = 6;
            "7" = 7;
            "8" = 8;
            "9" = 9;
            # "active" = "";
            # "default" = "";
          };

        };

        "hyprland/window" = {
          max-length = 60;
          separate-outputs = true;
          format = { };
          rewrite = { };
        };

        tray.spacing = 10;

        # Modules
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰚵";
            deactivated = "󰚵";
          };
        };

        bluetooth = {
          format = "{icon}";
          format-alt = "{icon}";
          interval = 30;
          format-icons = {
            enabled = "󰂯";
            disabled = "󰂯";
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

        "clock#time" = { format = "{:%H:%M}"; };
        "clock#date" = {
          format = "{:%d-%b-%y}";
          on-click = "exec gnome-calendar";
          "tooltip-format" =
            "<span size='10pt' font='GeistMono Nerd Font Mono'>{calendar}</span>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            # "weeks-pos"     = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#${base0A}'><b>{}</b></span>";
              "days" = "<span color='#${base07}'><b>{}</b></span>";
              "weeks" = "<span color='#${base0C}'><b>W{}</b></span>";
              "weekdays" = "<span color='#${base0B}'><b>{}</b></span>";
              "today" = "<span color='#${base0E}'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_down";
            "on-click-backward" = "tz_up";
            "on-scroll-up" = "shift_down";
            "on-scroll-down" = "shift_up";
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
          format = "bat {capacity}";
          format-plugged = "bat {capacity}";
          format-charging = "bat {capacity}ϟ";
          on-click = "gnome-power-statistics";
        };

        network = {
          format-disabled = "󰞃";
          format-wifi = "";
          format-ethernet = " {ipaddr}/{cidr}";
          format-linked = " (No IP)";
          format-disconnected = "";
          on-click = ''
            rfkill unblock wifi && kitty --hold sh -c "nmcli dev wifi rescan && nmtui"'';
          on-click-right = "rfkill block wifi";
        };

        pulseaudio = {
          format = "{icon} {format_source}";
          format-bluetooth = "{icon} {volume} {format_source}";
          format-bluetooth-muted = "   {volume} {format_source}";
          format-muted = "vol ______";
          format-source = "mic";
          format-source-muted = "";
          format-icons = {
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            speaker = [
<<<<<<< HEAD
              "volume: -- -- --"
              "volume: i- -- --"
              "volume: I- -- --"
              "volume: Ii -- --"
              "volume: II -- --"
              "volume: IIi-- --"
              "volume: III-- --"
              "volume: IIIi- --"
              "volume: IIII- --"
              "volume: IIIIi --"
              "volume: IIIII --"
              "volume: IIIIIi--"
              "volume: IIIIII--"
            ];
            default = [
              "volume: "
              "volume: i"
              "volume: I"
              "volume: Ii"
              "volume: II"
              "volume: IIi"
              "volume: III"
              "volume: IIIi"
              "volume: IIII"
              "volume: IIIIi"
              "volume: IIIII"
              "volume: IIIIIi"
              "volume: IIIIII"
=======
              "speaker ______"
              "speaker \\_____"
              "speaker |_____"
              "speaker |\\____"
              "speaker ||____"
              "speaker ||\\___"
              "speaker |||___"
              "speaker |||\\__"
              "speaker ||||__"
              "speaker ||||\\_"
              "speaker |||||_"
              "speaker |||||\\"
              "speaker ||||||"
            ];
            default = [
              "vol       "
              "vol .     "
              "vol \\     "
              "vol |     "
              "vol |.    "
              "vol |\\    "
              "vol ||    "
              "vol ||.   "
              "vol ||\\   "
              "vol |||   "
              "vol |||.  "
              "vol |||\\  "
              "vol ||||  "
              "vol ||||. "
              "vol ||||\\ "
              "vol ||||| "
              "vol |||||."
              "vol |||||\\"
              "vol ||||||"
>>>>>>> d326262a0d19945886d3de62c4fc19e166d4c4e0
            ];
            hdmi = [
              "hdmi ______"
              "hdmi \\_____"
              "hdmi |_____"
              "hdmi |\\____"
              "hdmi ||____"
              "hdmi ||\\___"
              "hdmi |||___"
              "hdmi |||\\__"
              "hdmi ||||__"
              "hdmi ||||\\_"
              "hdmi |||||_"
              "hdmi |||||\\"
              "hdmi ||||||"
            ];
            headphone = [
              "headset ______"
              "headset \\_____"
              "headset |_____"
              "headset |\\____"
              "headset ||____"
              "headset ||\\___"
              "headset |||___"
              "headset |||\\__"
              "headset ||||__"
              "headset ||||\\_"
              "headset |||||_"
              "headset |||||\\"
              "headset ||||||"
            ];
          };
          max-volume = 100;
          tooltip-format = "{desc}, {volume}%";
          on-click = "kitty sh -c 'pulsemixer'"; # or pavucontrol
          on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          on-click-middle = "helvum";
          scroll-step = 3;
        };

      };

    };

    style = ''
<<<<<<< HEAD
      	@define-color dark #${base00};
      	@define-color gray #${base03};
      	@define-color white #${base05};
      	@define-color accent #${base0D};
      	@define-color green #${base0B};
      	@define-color red #${base0E};
      	@define-color magenta #${base0F};
      	@define-color yellow #${base0A};
      	
      	/* Default setting for all modules */
      	* {
      	  border: 0px;
          border-radius: 0px;
          margin: 0px;
          padding: 0px;
          text-decoration: none;
      	  font-family: "GeistMono Nerd Font Propo Bold";
          font-weight: normal;
          font-size: 18px;
      	}
=======
            	@define-color dark #${base00};
            	@define-color gray #${base03};
            	@define-color white #${base05};
            	@define-color accent #${base0D};
            	@define-color green #${base0B};
            	@define-color red #${base0E};
            	@define-color magenta #${base0F};
            	@define-color yellow #${base0A};
            	
            	/* Default setting for all modules */
            	* {
            	  border: 0px;
                border-radius: 0px;
                margin: 0px;
                padding: 0px 5px 0px 5px;
                text-decoration: none;
            	  /* font-family: "GeistMono"; */ 
                font-size: 14px;
            	}
>>>>>>> d326262a0d19945886d3de62c4fc19e166d4c4e0

              /* Default color for modules except workspaces button.active */
              #workspaces button, #window, window#waybar, #tray, #language, #network, #bluetooth, #idle_inhibitor, #battery, #pulseaudio, #clock#time, #clock#date { color: @white; }

            	/* Default padding for some modules 
            	#language, #idle_inhibitor, #network, #clock, #tray, #bluetooth, #pulseaudio { padding: 0px 5px 0px 5px; }
      */          
              #window { padding: 0px 10px 0px 10px; }
              #mainBar { padding: 0px; }
              #language {
                background-color: #${base00};
              }
              #network {
                background-color: #${base00};
              }
              #bluetooth {
                background-color: #${base00};
              }
              #idle_inhibitor {
                background-color: #${base00};
              }
              #pulseaudio {
                background-color: #${base00};
              }
              #battery {
                background-color: #${base00};
              }
              #clock.date {
                background-color: #${base01};
              }
              #clock.time {
                background-color: #${base02};
              }
              
              #workspaces button { 
                font-weight: normal; 
                padding: 0px 2px 0px 2px;
              }
              #workspaces button.empty { 
                font-weight: normal; 
                padding: 0px 2px 0px 2px;
                color: @gray;
              }
              #workspaces button.active { 
                font-weight: normal; 
                color: @dark;
                background-color: @accent;
                padding: 0px 6px 0px 6px;
              }
              
              window#waybar {
                background-color: @dark;
              }

<<<<<<< HEAD
        #workspaces button { 
          padding: 0px 5px 0px 5px;
        }
        #workspaces button.empty { 
            color: gray;
        }
        #workspaces button.active { 
            color: @dark;
            background-color: @accent;
        }
        
        window#waybar {
          background-color: @dark;
        }
        /*
        window#waybar.empty {
          background-color: transparent;
        }
        */
        /* calendar look */
        tooltip {
          background-color: @dark;
          border: 2px;
          border-style: solid;
          border-color: @accent;
          font-size: 16px;
        }
=======
              window#waybar.empty {
                background-color: transparent;
              }
              
              /* calendar look */
              tooltip {
                background-color: @dark;
                border: 2px;
                border-style: solid;
                border-color: @accent;
                font-size: 16px;
              }

            	#network.disconnected { color: @red;}
            	#network.disabled { color: @gray; }
>>>>>>> d326262a0d19945886d3de62c4fc19e166d4c4e0

            	#idle_inhibitor.activated { color: @green; }
            	#idle_inhibitor.deactivated { color: @gray; }

<<<<<<< HEAD
      	#idle_inhibitor.activated { color: #${base0C}; }
      	#idle_inhibitor.deactivated { color: @gray; }
=======
            	#bluetooth { color: @green; }
            	#bluetooth.disabled { color: @gray; }
>>>>>>> d326262a0d19945886d3de62c4fc19e166d4c4e0

            	#pulseaudio.muted { color: @gray; }

            	#battery.plugged { color: @accent; }
            	#battery.charging{
                color: @accent;
                animation-name: blink;
                animation-duration: 1.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            	} 
            	#battery.warning:not(.charging) { color: @yellow; }
            	#battery.critical:not(.charging) { color: @red; }
            	@keyframes blink { to { color: @white; } }
            	'';
  };
}
