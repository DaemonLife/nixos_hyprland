{ pkgs, config, ... }: {

programs.nixvim = with config.colorScheme.palette; {

enable = true;
defaultEditor = true;
viAlias = true;
# luaLoader.enable = true;

plugins = {
    lightline.enable = true;
    nvim-colorizer.enable = true; # colors for hex code
    # nvim-colorizer.fileTypes = [ "tex" ];
    comment.enable = true;
};

plugins.lightline = {
    active = {
        left = [
            [
              "mode"
              "paste"
            ]
            [
              "readonly"
              "filename"
              "modified"
            ]
          ];
      right = [
            [
              "lineinfo"
            ]
            [
              "percent"
            ]
            [
              "fileformat"
              "fileencoding"
              "filetype"
            ]
      ];
    };
};

# Lightline colors settings
extraConfigVim = ''
    highlight LightlineLeft_active_0 guibg=#${base0D} guifg=#${base00}
    highlight LightlineLeft_active_1 guibg=#${base01} guifg=#${base03}

    highlight LightlineMiddle_active guibg=#${base01} guifg=#${base03}

    highlight LightlineRight_active_0 guibg=#${base01} guifg=#${base03}
    highlight LightlineRight_active_1 guibg=#${base01} guifg=#${base03}
    highlight LightlineRight_active_2 guibg=#${base01} guifg=#${base03}
'';

# Base16 theme setup
colorschemes.base16.enable = true;
colorschemes.base16.colorscheme = {
    base00 = "#${base00}";
    base01 = "#${base01}";
    base02 = "#${base02}";
    base03 = "#${base03}";
    base04 = "#${base04}";
    base05 = "#${base05}";
    base06 = "#${base06}";
    base07 = "#${base07}";
    base08 = "#${base08}";
    base09 = "#${base09}";
    base0A = "#${base0A}";
    base0B = "#${base0B}";
    base0C = "#${base0C}";
    base0D = "#${base0D}";
    base0E = "#${base0E}";
    base0F = "#${base0F}";
};

autoCmd = [
    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "tex"
        "latex"
        "markdown"
      ];
      command = "setlocal spell spelllang=en,ru";
    }
];

opts = {
	# Line numbers
	number = true;
	relativenumber = true;

	# Search
	ignorecase = true;
    smartcase = true;
    incsearch = true; # Incremental search: show match for partly typed search command

	# Tab defaults (might get overwritten by an LSP server)
	tabstop = 4;
	shiftwidth = 4;
	softtabstop = 0;
	expandtab = true;
	smarttab = true;
    autoindent = true; # Do clever autoindenting

	# System clipboard support, needs xclip/wl-clipboard
	clipboard = "unnamedplus";

	# Highlight the current line
	cursorline = true;

	# Show line and column when searching
	ruler = true;

	# Global substitution by default
	# gdefault = true;

	# Start scrolling when the cursor is X lines away from the top/bottom
	scrolloff = 8;

    # Other settings
    swapfile = false; # Disable the swap file
    fileencoding = "utf-8"; # File-content encoding for the current buffer
    spell = true; # Highlight spelling mistakes (local to window)

};
};

}
