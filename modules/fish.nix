{ pkgs, config, lib, ... }: {

  programs.fish = with config.lib.stylix.colors; {
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

    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "grc"; # colored output for some command (lsblk for example)
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    shellInit = "";

    interactiveShellInit = ''
      set --global hydro_symbol_prompt '>'
      set --global hydro_symbol_git_dirty '*'
      set --global hydro_symbol_git_ahead '↑'
      set --global hydro_symbol_git_behind '↓'
      set --global hydro_multiline true
      set --global fish_prompt_pwd_dir_length 40

      set --global hydro_color_pwd -o ${base0C} 

      if not set -q DISPLAY
        set --global hydro_symbol_prompt '!!>'
        set_color --background red
      end
    '';

    loginShellInit = ''
      if not set -q DISPLAY
        echo -e "\033[40m"  # make black background
        if test (tty) = "/dev/tty1"
          exec uwsm start hyprland-uwsm.desktop 
          # exec sway
        end
      end
    '';

    functions = {

      fish_greeting = "";

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
