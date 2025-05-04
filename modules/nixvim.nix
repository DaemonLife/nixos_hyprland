{ config, ... }: {

  programs.nixvim = with config.lib.stylix.colors; {
    enable = true;
    # defaultEditor = false;
    viAlias = true;
    vimAlias = true;

    plugins = {
      
      nix = {
        enable = true;
      };

      lsp = {
        enable = true;
          servers = {
            nil_ls.enable = true; # nix language server
          };
      };

      # autocomplite
      cmp = {         
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      # vim-visual-multi.enable = true; # multicursor

      lsp-format = {
          enable = true;
        lspServersToEnable = "all";
      };

      nvim-colorizer.enable = true; # colors for hex code

      comment = {
        enable = true;
      };

      nvim-autopairs.enable = true; # auto ""
      nvim-surround.enable = true; # auto "[text]"

      indent-blankline = {
        enable = true;
        settings = { indent.char = "┆"; };
      };

      lightline = {
        enable = true;
        settings = {
          active = {
            left = [ [ "mode" "paste" ] [ "readonly" "filename" "modified" ] ];
            right = [
              [ "lineinfo" ]
              [ "percent" ]
              [ "fileformat" "fileencoding" "filetype" ]
            ];
          };
        };
      };

    }; # plugins

    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Search
      ignorecase = true;
      smartcase = true;
      incsearch = true; # show match for partly typed search command

      # Tab defaults (might get overwritten by an LSP server)
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 0;
      expandtab = true;
      smarttab = true;
      autoindent = true; # Do clever autoindenting

      # Highlight the current line
      cursorline = true;

      # Show line and column when searching
      ruler = true;

      # Start scrolling when the cursor is X lines away from the top/bottom
      scrolloff = 4;

      # Other settings
      swapfile = false; # Disable the swap file
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      spell = true; # Highlight spelling mistakes (local to window)
      wrap = true;
      linebreak = true; 
      termguicolors = true; # like base16 color scheme for me

    };

    extraConfigVim = ''
    '';

    autoCmd = [
      # Setups for some files 
      {
        event = "FileType";
        pattern = [ "tex" "latex" "markdown" ];
        command = "setlocal spell spelllang=en,ru";
      }
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
    ];

    highlightOverride = {
      # status bar 
      "LightlineLeft_active_0" = {
        bg = "#${base0D}";
        fg = "#${base00}";
      };
      "LightlineLeft_active_1" = {
        bg = "#${base01}";
        fg = "#${base03}";
      };
      "LightlineMiddle_active" = {
        bg = "#${base01}";
        fg = "#${base03}";
      };
      "LightlineRight_active_0" = {
        bg = "#${base01}";
        fg = "#${base03}";
      };
      "LightlineRight_active_1" = {
        bg = "#${base01}";
        fg = "#${base03}";
      };
      "LightlineRight_active_2" = {
        bg = "#${base01}";
        fg = "#${base03}";
      };

      # number bar
      "LineNrAbove" = {
        bg = "#${base00}";
      };
      "CursorLineNr" = {
        bg="#${base00}";
      };
      "LineNrBelow" = {
        bg="#${base00}";
      };
    };

    # Base16 theme setup
    # colorschemes.base16 = {
    #   enable = true;
    #   colorscheme = {
    #     base00 = "#${base00}";
    #     base01 = "#${base01}";
    #     base02 = "#${base02}";
    #     base03 = "#${base03}";
    #     base04 = "#${base04}";
    #     base05 = "#${base05}";
    #     base06 = "#${base06}";
    #     base07 = "#${base07}";
    #     base08 = "#${base08}";
    #     base09 = "#${base09}";
    #     base0A = "#${base0A}";
    #     base0B = "#${base0B}";
    #     base0C = "#${base0C}";
    #     base0D = "#${base0D}";
    #     base0E = "#${base0E}";
    #     base0F = "#${base0F}";
    #   };
    # };

    keymaps = [

      {
        action = "<cmd>redo<CR><CR>";
        key = "U";
        options.desc = "Redo.";
      }
      {
        action = ''"+y'';
        key = "<space>y";
        options.desc = "Copy to system clipboard.";
      }
      {
        action = ''"+p'';
        key = "<space>p";
        options.desc = "Paste from system clipboard.";
      }
      {
        action = "gcc";
        key = "<space>c";
        mode = "n";
        options = {
          remap = true;
          desc = "Comment in normal mode.";
        };
      }
      {
        action = "gc";
        key = "<space>c";
        mode = "v";
        options = {
          remap = true;
          desc = "Comment in visual mode.";
        };
      }

      # soft string jumping
      {
        action = "gj";
        key = "j";
      }
      {
        action = "gk";
        key = "k";
      }

      # other
      {
        action = "";
        key = "<C-r>";
      }
      {
        action = "";
        key = " ";
      }

      # rus layout support
      {
        action = "q";
        key = "й";
      }
      {
        action = "Q";
        key = "Й";
      }
      {
        action = "w";
        key = "ц";
      }
      {
        action = "W";
        key = "Ц";
      }
      {
        action = "e";
        key = "у";
      }
      {
        action = "E";
        key = "У";
      }
      {
        action = "r";
        key = "к";
      }
      {
        action = "R";
        key = "К";
      }
      {
        action = "t";
        key = "е";
      }
      {
        action = "T";
        key = "Е";
      }
      {
        action = "y";
        key = "н";
      }
      {
        action = "Y";
        key = "Н";
      }
      {
        action = "u";
        key = "г";
      }
      {
        action = "U";
        key = "Г";
      }
      {
        action = "i";
        key = "ш";
      }
      {
        action = "I";
        key = "Ш";
      }
      {
        action = "o";
        key = "щ";
      }
      {
        action = "O";
        key = "Щ";
      }
      {
        action = "p";
        key = "з";
      }
      {
        action = "P";
        key = "З";
      }
      {
        action = "[";
        key = "х";
      }
      {
        action = "{";
        key = "Х";
      }
      {
        action = "a";
        key = "ф";
      }
      {
        action = "A";
        key = "Ф";
      }
      {
        action = "s";
        key = "ы";
      }
      {
        action = "S";
        key = "Ы";
      }
      {
        action = "d";
        key = "в";
      }
      {
        action = "D";
        key = "В";
      }
      {
        action = "f";
        key = "а";
      }
      {
        action = "F";
        key = "А";
      }
      {
        action = "g";
        key = "п";
      }
      {
        action = "G";
        key = "П";
      }
      {
        action = "h";
        key = "р";
      }
      {
        action = "H";
        key = "Р";
      }
      {
        action = "gj";
        key = "о";
      }
      {
        action = "J";
        key = "О";
      }
      {
        action = "gk";
        key = "л";
      }
      {
        action = "K";
        key = "Л";
      }
      {
        action = "l";
        key = "д";
      }
      {
        action = "L";
        key = "Д";
      }
      {
        action = ";";
        key = "ж";
      }
      {
        action = ":";
        key = "Ж";
      }
      {
        action = "z";
        key = "я";
      }
      {
        action = "Z";
        key = "Я";
      }
      {
        action = "x";
        key = "ч";
      }
      {
        action = "X";
        key = "Ч";
      }
      {
        action = "c";
        key = "с";
      }
      {
        action = "C";
        key = "С";
      }
      {
        action = "v";
        key = "м";
      }
      {
        action = "V";
        key = "М";
      }
      {
        action = "b";
        key = "и";
      }
      {
        action = "B";
        key = "И";
      }
      {
        action = "n";
        key = "т";
      }
      {
        action = "N";
        key = "Т";
      }
      {
        action = "m";
        key = "ь";
      }
      {
        action = "M";
        key = "Ь";
      }
      {
        action = ",";
        key = "б";
      }
      {
        action = "<";
        key = "Б";
      }
      {
        action = ".";
        key = "ю";
      }
      {
        action = ">";
        key = "Ю";
      }
      {
        action = "/";
        key = "я";
      }
      {
        action = "?";
        key = "Я";
      }
    ];
  };

}
