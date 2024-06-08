{ pkgs, config, ... }: {

programs.fuzzel = with config.colorScheme.colors; {
	enable = true;
	settings = {
		main = {
			font = "Jetbrains Mono:weight=regular:size=14";
			dpi-aware = "auto";
			icons-enabled = "no";
			show-actions = "no";
			horizontal-pad = 40;
			vertical-pad = 30;
			exit-on-keyboard-focus-loss = "no";
		};

		colors = {
			background = "${base00}ff";
			text = "${base05}ff";
			match = "${base0D}ff";
			selection = "${base0D}dd";
			selection-match = "${base0A}ff";
			selection-text = "${base00}ff";
			border = "${base0D}ff";
		};

		border.width = 1;
		border.radius = 0;
	};
};

}
