{ pkgs, config, ... }: {

  programs.helix = {

    enable = true;
    settings = {

      # theme = "base16_transparent";
      editor = {
        # Show currently open buffers, only when more than one exists.
        bufferline = "multiple";
        line-number = "relative";
        # Highlight all lines with a cursor
        cursorline = true;
        # Force the theme to show colors
        true-color = true;
        lsp.display-messages = true;
        gutters = [ "diagnostics" "spacer" "line-numbers" "spacer" "diff" ];
        color-modes = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          character = "┆";
          render = true;
          skip-levels = 1;
        };

        statusline = {
          left = [ "mode" "spinner" "version-control" "file-name" ];
        };

        soft-wrap = {
          enable = true;
          max-wrap = 25; # increase value to reduce forced mid-word wrapping
          max-indent-retain = 0;
          wrap-indicator = ""; # set wrap-indicator to "" to hide it
        };

      };

      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
        A-x = "extend_to_line_bounds";
        X = [ "extend_line_up" "extend_to_line_bounds" ];
        C-right = "move_next_word_start";
        C-left = "move_prev_word_start";
        C-up = "move_visual_line_up";
        C-down = "move_visual_line_down";
      };

      keys.insert = {
        C-right = "move_next_word_start";
        C-left = "move_prev_word_start";
        C-up = "move_visual_line_up";
        C-down = "move_visual_line_down";
      };

      keys.select = {
        A-x = "extend_to_line_bounds";
        X = [ "extend_line_up" "extend_to_line_bounds" ];
      };

    }; # settings

    languages = {
      language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        indent = {
          tab-width = 2;
          unit = "	";
        };
      }];
    };

  }; # programs
} # main

