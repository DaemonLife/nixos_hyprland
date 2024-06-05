{ pkgs, config, ... }:{

	services.mako = with config.colorScheme.colors; {
		enable = true;

		backgroundColor = "#${base01}";
		borderColor = "#${base0E}";
		textColor = "#${base04}";
		layer = "overlay";
		anchor = "bottom-right";
		width = 350;
		margin = "0,2,2";
		padding = "10";
		borderSize = 2;
		borderRadius = 0;
		defaultTimeout = 10000;
		groupBy = "summary";
		font = "JetBrains Mono Regular";
		format = "<b>%s</b>\\n%b";

	};

}
