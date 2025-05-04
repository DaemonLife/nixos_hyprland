{ config, lib, ... }: with config.lib.stylix.colors; {

    programs.swaylock = lib.mkForce {
        enable = true;
        settings = {
            color = "000000";
            
            inside-color = "00000000";
            inside-clear-color = "00000000";
            inside-caps-lock-color = "00000000";
            inside-ver-color = "00000000";
            inside-wrong-color = "00000000";

            layout-bg-color = "00000000";
            layout-border-color = "00000000";
            layout-text-color = "${base0E}";

            ring-color = "${base00}";
            ring-clear-color = "${base06}";
            ring-ver-color  = "${base0B}";
            ring-wrong-color = "${base08}";
            ring-caps-lock-color = "${base0F}";

            key-hl-color = "${base0B}";
            bs-hl-color = "${base08}";
            separator-color = "00000000";
            text-color = "${base02}";
            text-clear-color = "${base06}";
            text-caps-lock-color = "${base0F}";
            text-ver-color = "${base0B}";
            text-wrong-color = "${base08}";

            font = "JetBrains Bold";
            font-size = 42;

            indicator-idle-visible = false;
            indicator-radius = 110;
            indicator-thickness = 14;
            line-uses-ring = true;

            show-failed-attempts = true;

            ignore-empty-password = true;
            daemonize = false;
            show-keyboard-layout = false;
            hide-keyboard-layout = true;
            indicator-caps-lock = true;
        };

    };

}
