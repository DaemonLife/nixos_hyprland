# Not all is declarative! You need install and sometimes update plugins. Check 'ya --help' for details, 'ya -l' for list plugins.

# Installation:
# ya pkg add boydaihungst/file-extra-metadata
# ya pkg add KKV9/compress
# ya pkg add atareao/convert

{ pkgs, config, lib, ... }: {
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
      mount = yaziPlugins.mount;
      smart-enter = yaziPlugins.smart-enter;
      git = yaziPlugins.git;
      mime-ext = yaziPlugins.mime-ext;
    };

    settings = {
      floating_window_scaling_factor = 0.5;
      plugin = {
        prepend_preloaders = [
          # ARW support preview
          # {
          #   name = "*.ARW";
          #   run = "magick";
          # }
        ];

        prepend_fetchers = [
          # plugin mime-ext
          {
            id = "mime";
            name = "*";
            run = "mime-ext";
            prio = "high";
          }
          # plugin git
          {
            id = "git";
            name = "*";
            run = "git";
          }
          # plugin git
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        append_previewers = [
          # plugin extra metadata
          {
            name = "*";
            run = "file-extra-metadata";
          }
          # ARW support
          # {
          #   name = "*.ARW";
          #   run = "magick";
          # }
        ];
        spotters = [
          # plugin extra metadata
          {
            name = "*";
            run = "file-extra-metadata";
          }
        ];
      };

      preview = {
        image_filter = "triangle";
        image_quality = 70;
        max_width = 800;
        max_height = 800;
      };

      tasks = {
        image_alloc = 1536870912; # ARW support
        image_bound = [ 10000 10000 ]; # no limit for images preview
      };

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
            run = ''nomacs "$@"'';
            desc = "Open in nomacs";
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
          name = "*.ARW";
          use = "image";
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
          mime = "";
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
      tabs = {
        active = {
          fg = "#${base00}";
          bg = "#${base0B}";
        };
        inactive = {
          fg = "#${base03}";
          bg = "#${base01}";
        };
        sep_inner = {
          open = "";
          close = "";
        };
        sep_outer = {
          open = "";
          close = "";
        };
      };

      mgr = {
        border_symbol = "│";
        border_style = {
          fg = "#${base01}";
        };

        count_copied = {
          fg = "#${base00}";
          bg = "#${base0B}";
        };
        count_cut = {
          fg = "#${base00}";
          bg = "#${base08}";
        };
        count_selected = {
          fg = "#${base00}";
          bg = "#${base0A}";
        };

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

    keymap = {
      mgr.prepend_keymap = [
        # copy to system clipboard
        {
          on = "<C-y>";
          run = [
            ''
              shell --interactive 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' 
            ''
          ];
        }
        {
          on = "<C-н>";
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
        {
          on = "<C-п>";
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
        {
          on = "<C-ь>";
          run = "plugin mount";
          desc = "Mount partitions";
        }
        # plugin smart enter
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "д";
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
        # other rus
        {
          on = "Р";
          run = "back";
          desc = "Back to previous directory";
        }
        {
          on = "Д";
          run = "forward";
          desc = "Forward to next directory";
        }

        {
          on = "р";
          run = "leave";
          desc = "Back to parent directory";
        }
        {
          on = "л";
          run = "arrow prev";
          desc = "Previous file";
        }
        {
          on = "о";
          run = "arrow next";
          desc = "Next file";
        }
        {
          on = "й";
          run = "quit";
          desc = "ru: quit";
        }
        {
          on = "м";
          run = "visual_mode";
          desc = "ru: visual mode enter";
        }
        {
          on = "н";
          run = "yank";
          desc = "ru: yank";
        }
        {
          on = "Н";
          run = "unyank";
          desc = "ru: unyank";
        }
        {
          on = "ч";
          run = "yank --cut";
          desc = "ru: cut";
        }
        {
          on = "Ч";
          run = "unyank";
          desc = "ru: uncut";
        }
        {
          on = "з";
          run = "paste";
          desc = "ru: paste";
        }
        {
          on = "в";
          run = "remove";
          desc = "ru: trash";
        }
        {
          on = "В";
          run = "remove --permanently";
          desc = "ru: delete";
        }
        { on = "е"; run = "tab_create --current"; desc = "Create a new tab with CWD"; }
        { on = "ц"; run = "tasks:show"; desc = "Show task manager"; }
      ];
    };

  };
}
