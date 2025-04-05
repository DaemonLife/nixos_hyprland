{ pkgs, config, lib, ... }: {

  programs.fish = {
    enable = true;
    shellAliases = {
      # os help - for help
      os = "$HOME/nix/scripts/nix_rebuild.sh";

      # for windows fs on lenovo
      mwin = "$HOME/nix/scripts/cdwin.fish && cd /mnt/windows/Users/user";

      # battery configuration will be restored at the next boot
      tlp_full = "sudo tlp fullcharge bat1";
      tlp_conserv = "sudo tlp setcharge bat1";
    };

    shellAbbrs = {
      jrnl = " jrnl"; # hide from shell history
    };

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    } # colors
      ];

    shellInit = "";
    loginShellInit = ''
      if not set -q DISPLAY
        if test (tty) = "/dev/tty1"
          exec uwsm start hyprland-uwsm.desktop # > /dev/null
          # exec sway
        end
      end
    '';

    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        	builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
