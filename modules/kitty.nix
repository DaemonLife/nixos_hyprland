{ pkgs, config, ... }: {
	
	programs.kitty = with config.colorScheme.palette; {

		enable = true;
		# theme = "";
		shellIntegration.enableZshIntegration = true;
		settings = {

			# Font
			font_family = "JetBrains Mono";
			bold_font = "JetBrains Mono bold";
			italic_font = "JetBrains Mono Italic";
			bold_italic_font = "JetBrains Mono Medium Italic";
			font_size = "12.0";

			shell = "zsh";
			editor = "nvim";
			linux_display_server = "wayland";
			enable_audio_bell = false;
			notify_on_cmd_finish = "always 3.0 command notify-send \"Terminal job\" Finished";
			visual_bell_duration = "0.1";
			hide_window_decorations = "yes";
			open_url_with = "firefox";
			window_border_width = "0.0pt";
			draw_minimal_borders = "yes";
			# window_margin_width 3 4
			window_padding_width = "3 4";
			# inactive_text_alpha = "0.5";
			tab_bar_style = "hidden";
			confirm_os_window_close = "0";

			# Colors
			visual_bell_color = "#${base04}";
			foreground = "#${base06}";
			background = "#${base00}"; 
			cursor = "#${base06}";
			cursor_text_color = "#${base06}"; 
			selection_foreground = "#${base02}"; 
			selection_background = "#${base0D}"; 
			# black
			color0 = "#${base03}"; 
			color8 = "#${base04}"; 
			# red
			color1 = "#${base08}"; 
			color9 = "#${base08}"; 
			# green
			color2 = "#${base0B}";  
			color10 = "#${base0B}"; 
			# yellow
			color3 = "#${base0A}";  
			color11 = "#${base0A}"; 
			# blue
			color4 = "#${base0D}";  
			color12 = "#${base0D}"; 
			# magenta
			color5 = "#${base0E}";  
			color13 = "#${base0E}"; 
			# cyan
			color6 = "#${base0C}";  
			color14 = "#${base0C}"; 
			# white
			color7 = "#${base05}";  
			color15 = "#${base07}"; 
		};
	};

}
