{ pkgs, config, lib, ... }: {

  programs.fish = {
    enable = true;
    shellAliases = {
      # update [device]
      update = "nh os switch $HOME/nix/. -H $1";
      upgrade = "nh os switch -u $HOME/nix -H $1";

      # for windows fs on lenovo
      cdwin = "$HOME/nix/scripts/cdwin.fish && cd /mnt/windows/Users/user";

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
    loginShellInit = "";

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
