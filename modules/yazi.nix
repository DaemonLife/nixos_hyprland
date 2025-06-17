# Not all is declarative! You need install and sometimes update plugins. Check 'ya --help' for details, 'ya -l' for list plugins.

# Installation:
# ya pack -a yazi-rs/plugins:smart-enter
# ya pack -a yazi-rs/plugins:mount

{ pkgs
, config
, lib
, ...
}:
{

  home.packages = with pkgs; [ xdragon ];

  programs.yazi = with config.lib.stylix.colors; {
    enable = true;
    # package = pkgs.unstable.yazi;
    enableFishIntegration = true;

    # clipboard sync for all yazi instances and git plugin init
    initLua = ''
      require("session"):setup {
      	sync_yanked = true,
      }
    '';
    #   require("git"):setup()
    # '';

    # # settings for plugins
    # settings.plugin = {
    #   prepend_fetchers = [
    #     {
    #       id = "git";
    #       name = "*";
    #       run = "git";
    #     }
    #     {
    #       id = "git";
    #       name = "*/";
    #       run = "git";
    #     }
    #   ];
    # };

    keymap.manager.prepend_keymap = [
      # copy to system clipboard
      {
        on = "<C-y>";
        run = [
          ''
            shell --interactive 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' 
          ''
        ];
      }
      # drag and drop
      {
        on = "<C-n>";
        run = ''
          shell --interactive '${pkgs.xdragon}/bin/dragon -x -i -T "$1"'
        '';
      }
      {
        on = "M";
        run = "plugin mount";
        desc = "Mount partitions";
      }
      {
        on = "l";
        run = "plugin smart-enter";
        desc = "Enter the child directory, or open the file";
      }
    ];

    settings = {

      manager = {
        sort_dir_first = true;
        # linemode = "size_and_mtime";
        title_format = "{cwd}";
      };

      opener = {
        "video" = [
          {
            run = ''mpv "$@" >/dev/null 2>&1 &'';
            desc = "Play video";
            block = true;
            orphan = true;
          }
        ];
        "edit" = [
          {
            run = ''$EDITOR "$@"'';
            desc = "Edit";
            block = true;
          }
        ];
        "open" = [
          {
            run = ''xdg-open "$@"'';
            desc = "Open";
          }
        ];
        "image" = [
          {
            run = ''imv-dir "$@"'';
            desc = "Open in imv";
            orphan = true;
          }
        ];
        "default_browser" = [
          {
            run = ''$BROWSER "$@"'';
            desc = "Open in default browser";
            orphan = true;
          }
        ];
        "librewolf" = [
          {
            run = ''librewolf "$@"'';
            desc = "Open in Librewolf";
            orphan = true;
          }
        ];
        "qutebrowser" = [
          {
            run = ''qutebrowser "$@"'';
            desc = "Open in qutebrowser";
            orphan = true;
          }
        ];
        "qbittorrent" = [
          {
            run = ''qbittorrent "$@"'';
            desc = "Open in qBittorrent";
            orphan = true;
          }
        ];
        "rtorrent" = [
          {
            run = ''cp "$@" $HOME/Downloads/rtorrent/watch && $TERMINAL --execute rtorrent'';
            desc = "Open in rtorrent";
            orphan = true;
          }
        ];
      };

      # check file mime type: xdg-mime query filetype [FILE]
      open.rules = [
        {
          mime = "image/*";
          use = [ "image" ];
        }
        {
          mime = "video/*";
          use = [ "video" ];
        }
        {
          mime = "application/x-bittorrent";
          use = [
            "qbittorrent"
            "rtorrent"
          ];
        }
        {
          mime = "application/json";
          use = [ "edit" ];
        }
        {
          mime = "text/html";
          use = [
            "default_browser"
            "librewolf"
            "qutebrowser"
            "edit"
          ];
        }
        {
          mime = "*";
          use = [ "edit" ];
        }
      ];

    }; # settings end

    theme = lib.mkForce {

      manager = {
        border_symbol = "│";
        border_style = {
          fg = "#${base01}";
        };

        tab_active = {
          fg = "#${base00}";
          bg = "#${base0B}";
        };
        tab_inactive = {
          fg = "#${base03}";
          bg = "#${base01}";
        };
        tab_width = 1;

        # Color block on the left side separator line in the filename.
        # marker_copied = {
        #   bg = "#${base0B}";
        #   fg = "#${base0B}";
        # };
        # marker_cut = {
        #   bg = "#${base0E}";
        #   fg = "#${base0E}";
        # };
        # marker_marked = { # SEL/V mode
        #   bg = "#${base0F}";
        #   fg = "#${base0F}";
        # };
        # marker_selected = {
        #   bg = "#${base0A}";
        #   fg = "#${base0A}";
        # };

      };

      mode = {
        normal_main = {
          fg = "#${base00}";
          bg = "#${base03}";
        };
        normal_alt = {
          # file size info, etc
          fg = "#${base04}";
          bg = "#${base01}";
        };
        select_main = {
          fg = "#${base00}";
          bg = "#${base0F}";
        };
        select_alt = {
          fg = "#${base04}";
          bg = "#${base01}";
        };
        unset_main = {
          fg = "#${base00}";
          bg = "#${base0E}";
        };
        unset_alt = {
          fg = "#${base04}";
          bg = "#${base01}";
        };
      };

      status = {
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };
        overall = {
          fg = "#${base04}";
          bg = "#${base01}";
        };
      };

    };

  };
}
