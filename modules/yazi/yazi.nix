# Not all is declarative! You need install and sometimes update plugins. Check 'ya --help' for details, 'ya -l' for list plugins.

# Installation:
# ya pack -a yazi-rs/plugins:smart-enter
# ya pack -a yazi-rs/plugins:mount

{ pkgs, config, lib, ... }: {

  home.packages = with pkgs; [ xdragon ];

  programs.yazi = with config.lib.stylix.colors; {
    enable = true;
    package = pkgs.unstable.yazi;
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
        run = [''
          shell --interactive 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' 
        ''];
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
        "video" = [{
          run = ''mpv "$@" >/dev/null 2>&1 &'';
          desc = "Play video";
          block = true;
          orphan = true;
        }];
        "edit" = [{
          run = ''$EDITOR "$@"'';
          desc = "Edit";
          block = true;
        }];
        "open" = [{
          run = ''xdg-open "$@"'';
          desc = "Open";
        }];
        "image" = [{
          run = ''imv "$@" *'';
          desc = "Open in imv";
          orphan = true;
        }];
        "default_browser" = [{
          run = ''$BROWSER "$@"'';
          desc = "Open in default browser";
          orphan = true;
        }];
        "librewolf" = [{
          run = ''librewolf "$@"'';
          desc = "Open in Librewolf";
          orphan = true;
        }];
        "qutebrowser" = [{
          run = ''qutebrowser "$@"'';
          desc = "Open in qutebrowser";
          orphan = true;
        }];
        "qbittorrent" = [{
          run = ''qbittorrent "$@"'';
          desc = "Open in qBittorrent";
          orphan = true;
        }];
        "rtorrent" = [{
          run = ''
            cp "$@" $HOME/Downloads/rtorrent/watch && $TERMINAL --execute rtorrent'';
          desc = "Open in rtorrent";
          orphan = true;
        }];
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
          use = [ "qbittorrent" "rtorrent" ];
        }
        {
          mime = "application/json";
          use = [ "edit" ];
        }
        {
          mime = "text/html";
          use = [ "default_browser" "librewolf" "qutebrowser" "edit" ];
        }
        {
          mime = "*";
          use = [ "edit" ];
        }
      ];

    }; # settings end

    theme = lib.mkForce {
      manager = {
        cwd = { fg = "#${base0A}"; };

        hovered = {
          fg = "#${base00}";
          bg = "#${base0B}";
          bold = true;
        };
        preview_hovered = { underline = true; };

        find_keyword = {
          fg = "#${base0C}";
          italic = true;
        };
        find_position = {
          fg = "#${base0F}";
          bg = "reset";
          italic = true;
        };

        marker_copied = {
          fg = "#${base0B}";
          bg = "#${base0B}";
        };
        marker_cut = {
          fg = "#${base0C}";
          bg = "#${base0C}";
        };
        marker_marked = {
          fg = "#${base0A}";
          bg = "#${base0A}";
        };
        marker_selected = {
          fg = "#${base08}";
          bg = "#${base08}";
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

        count_copied = {
          fg = "#${base00}";
          bg = "#${base0B}";
        };
        count_cut = {
          fg = "#${base00}";
          bg = "#${base0C}";
        };
        count_selected = {
          fg = "#${base00}";
          bg = "#${base08}";
        };

        border_symbol = "│";
        border_style = { fg = "#${base02}"; };

        syntect_theme = "";
      };

      status = {
        # separator_open = "";
        # separator_close = "";
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = "#${base04}";
          bg = "#${base01}";
        };

        mode_normal = {
          fg = "#${base04}";
          bg = "#${base02}";
          bold = true;
        };
        mode_select = {
          fg = "#${base00}";
          bg = "#${base0B}";
          bold = true;
        };
        mode_unset = {
          fg = "#${base00}";
          bg = "#${base0F}";
          bold = true;
        };

        progress_label = { bold = true; };
        progress_normal = {
          fg = "#${base08}";
          bg = "#${base00}";
        };
        progress_error = {
          fg = "#${base0E}";
          bg = "#${base00}";
        };

        permissions_t = { fg = "#${base0B}"; };
        permissions_r = { fg = "#${base0A}"; };
        permissions_w = { fg = "#${base0C}"; };
        permissions_x = { fg = "#${base0B}"; };
        permissions_s = { fg = "#${base02}"; };
      };

      select = {
        border = { fg = "#${base08}"; };
        active = { fg = "#${base0F}"; };
        inactive = { };
      };

      input = {
        border = { fg = "#${base08}"; };
        title = { };
        value = { };
        selected = { reversed = true; };
      };

      completion = {
        border = { fg = "#${base08}"; };
        active = { bg = "#${base02}"; };
        inactive = { };

        icon_file = "";
        icon_folder = "";
        icon_command = "";
      };

      tasks = {
        border = { fg = "#${base08}"; };
        title = { };
        hovered = { underline = true; };
      };

      which = {
        cols = 3;
        mask = { bg = "#${base00}"; };
        cand = { fg = "#${base0E}"; };
        rest = { fg = "#${base02}"; };
        desc = { fg = "#${base0F}"; };
        separator = "  ";
        separator_style = { fg = "#${base02}"; };
      };

      help = {
        on = { fg = "#${base0F}"; };
        run = { fg = "#${base09}"; };
        desc = { fg = "#${base07}"; };
        hovered = {
          reversed = true;
          bold = true;
        };
        footer = {
          fg = "#${base03}";
          bg = "#${base07}";
        };
      };

      filetype = {
        rules = [
          {
            mime = "image/*";
            fg = "#${base0D}";
          }
          {
            mime = "video/*";
            fg = "#${base09}";
          }
          {
            mime = "audio/*";
            fg = "#${base0B}";
          }
          {
            mime = "application/zip";
            fg = "#${base0F}";
          }
          {
            mime = "application/gzip";
            fg = "#${base0F}";
          }
          {
            mime = "application/x-tar";
            fg = "#${base0F}";
          }
          {
            mime = "application/x-bzip";
            fg = "#${base0F}";
          }
          {
            mime = "application/x-bzip2";
            fg = "#${base0F}";
          }
          {
            mime = "application/x-7z-compressed";
            fg = "#${base0F}";
          }
          {
            mime = "application/x-rar";
            fg = "#${base0F}";
          }
          {
            mime = "application/xz";
            fg = "#${base0F}";
          }
          # Documents
          {
            mime = "text/*";
            fg = "#${base05}";
          }
          {
            mime = "application/doc";
            fg = "#${base08}";
          }
          {
            mime = "application/pdf";
            fg = "#${base0E}";
          }
          {
            mime = "application/rtf";
            fg = "#${base0B}";
          }
          {
            mime = "application/vnd.*";
            fg = "#${base0B}";
          }
          # Fallback
          {
            name = "*/";
            fg = "#${base0A}";
            bold = true;
          }
        ];
      };
    };
  };
}
