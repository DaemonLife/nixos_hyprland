# Not all is declarative! You need install and sometimes update plugins. Check 'ya --help' for details, 'ya -l' for list plugins.

# Installation:
# ya pkg add boydaihungst/file-extra-metadata
# ya pkg add KKV9/compress
# ya pkg add atareao/convert

{ pkgs, config, lib, ... }:
{
  home.packages = with pkgs; [ xdragon ];

  programs.yazi = with config.lib.stylix.colors; {
    enable = true;
    enableFishIntegration = true;

    initLua = ''
      require("session"):setup {
      	sync_yanked = true,
      }
      require("git"):setup()
    '';

    plugins = with pkgs; {
      smart-filter = yaziPlugins.smart-filter;
      mount = yaziPlugins.mount;
      smart-enter = yaziPlugins.smart-enter;
      git = yaziPlugins.git;
    };

    settings.plugin = {
      # plugin git
      prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
      # plugin extra metadata
      append_previewers = [
        {
          name = "*";
          run = "file-extra-metadata";
        }
      ];
      spotters = [
        {
          name = "*";
          run = "file-extra-metadata";
        }
      ];
    };

    keymap.mgr.prepend_keymap = [
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
        on = "<C-g>";
        run = ''
          shell --interactive '${pkgs.xdragon}/bin/dragon -x -i -T "$1"'
        '';
      }
      # plugin file-extra-metadata
      {
        on = "<Tab>";
        run = "spot";
        desc = "Spot hovered file";
      }
      # plugin mount
      {
        on = "<C-m>";
        run = "plugin mount";
        desc = "Mount partitions";
      }
      # plugin smart enter
      {
        on = "l";
        run = "plugin smart-enter";
        desc = "Enter the child directory, or open the file";
      }
      # plugin compress
      {
        on = [ "c" "a" "a" ];
        run = "plugin compress";
        desc = "Archive selected files";
      }
      {
        on = [ "c" "a" "p" ];
        run = "plugin compress -p";
        desc = "Archive (password)";
      }
      {
        on = [ "c" "a" "h" ];
        run = "plugin compress -ph";
        desc = "Archive (password+header)";
      }
      {
        on = [ "c" "a" "l" ];
        run = "plugin compress -l";
        desc = "Archive (compression level)";
      }
      {
        on = [ "c" "a" "u" ];
        run = "plugin compress -phl";
        desc = "Archive (password+header+level)";
      }
      # plugin convert imgs
      {
        on = [ "c" "p" ];
        run = "plugin convert -- --extension='png'";
        desc = "Convert to PNG";
      }
      {
        on = [ "c" "j" ];
        run = "plugin convert -- --extension='jpg'";
        desc = "Convert to JPG";
      }
      {
        on = "F";
        run = "plugin smart-filter";
        desc = "Smart filter";
      }

    ];

    settings = {

      mgr = {
        sort_dir_first = true;
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
            run = ''cp "$@" $HOME/Downloads/rtorrent/watch && kitty --hold sh -c "rtorrent"'';
            desc = "Open in rtorrent";
            orphan = true;
          }
        ];
      };

      # check file mime type: xdg-mime query filetype [FILE]
      open.append_rules = [
        {
          mime = "image/*";
          use = [ "image" ];
        }
        {
          mime = "video/*";
          use = [ "video" ];
        }
        {
          name = "*.torrent";
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

      mgr = {
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
