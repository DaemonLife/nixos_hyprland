{ pkgs, config, ... }: {

  programs.qutebrowser = with config.lib.stylix.colors; {
    enable = true;

    quickmarks = {
       nixpkgs = "https://github.com/NixOS/nixpkgs";
       home-manager = "https://github.com/nix-community/home-manager";
    };

    searchEngines = {
       w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
       aw = "https://wiki.archlinux.org/?search={}";
       nw = "https://wiki.nixos.org/index.php?search={}";
       g = "https://www.google.com/search?hl=en&q={}";
    };

    greasemonkey = [
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/afreakk/greasemonkeyscripts/1d1be041a65c251692ee082eda64d2637edf6444/youtube_sponsorblock.js";
        sha256 = "sha256-e3QgDPa3AOpPyzwvVjPQyEsSUC9goisjBUDMxLwg8ZE=";
      })
      (pkgs.writeText "some-script.js" ''
        // ==UserScript==
        // @name  Some Greasemonkey script
        // ==/UserScript==
      '')
    ];

    keyBindings = {
      normal = {
        "<Ctrl-v>" = "spawn mpv {url}";
      };
    };

    aliases = {
      "q" = "close";
      "qa" = "quit";
      "w" = "session-save";
      "wq" = "quit --save";
      "wqa" = "quit --save";
      "dme" = "set colors.webpage.darkmode.enabled true";
      "dmd" = "set colors.webpage.darkmode.enabled false";
    };

    loadAutoconfig = true;

    settings = {

      content.blocking.adblock.lists = [
        # "https://easylist.to/easylist/easylist.txt"
        # "https://easylist.to/easylist/easyprivacy.txt"
        # "https://easylist-downloads.adblockplus.org/easylistdutch.txt"
        # "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
        # "https://www.i-dont-care-about-cookies.eu/abp/"
        # "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"

        # from my uBlockOrigin filters
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2020.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2021.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2022.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2023.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2024.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/filters-2025.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/badware.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/privacy.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/quick-fixes.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/refs/heads/master/filters/unbreak.txt"
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/annoyances-cookies.txt"
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
        "https://easylist.to/easylist/fanboy-social.txt"

        "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-domains.txt"
        "https://github.com/easylist/easylist/raw/refs/heads/master/easylist_cookie/easylist_cookie_general_block.txt"
        "https://github.com/easylist/easylist/raw/refs/heads/master/easylist_cookie/easylist_cookie_general_hide.txt"

        "https://easylist-downloads.adblockplus.org/advblock.txt"
      ];

      auto_save.session = true;
      scrolling.smooth = false;

      window = {
        hide_decoration = true;
      };

      tabs = {
        favicons.scale = 0.8;
        title.format = "{audio}{current_title}";
        title.format_pinned = "{index}";
      };

      colors = {
        webpage.preferred_color_scheme = "dark";
      };

      qt = {
        highdpi = true;
      };

      hints.radius = 0;
      # editor.command = ["alacritty" "--command" "nvim" "--cmd" "startinsert" "{file}"];
      editor.command = ["alacritty" "--command" "nvim" "{file}"];
      content.autoplay = true;

    };

    extraConfig = ''

c.colors.completion.fg = ['#${base03}', '#${base0B}', '#${base08}']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#${base00}'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#${base00}'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#${base0B}'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#${base00}'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = 'rgba(0,0,0,0)'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = 'rgba(0,0,0,0)'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#${base01}'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#${base0D}'

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#${base0D}'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#${base0D}'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#${base05}'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#${base05}'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#${base0D}'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = 'rgba(0,0,0,0)'

# Background color of the context menu. If set to null, the Qt default
# is used.
# Type: QssColor
c.colors.contextmenu.menu.bg = '#${base00}'

# Foreground color of the context menu. If set to null, the Qt default
# is used.
# Type: QssColor
c.colors.contextmenu.menu.fg = '#${base05}'

# Background color of the context menu's selected item. If set to null,
# the Qt default is used.
# Type: QssColor
c.colors.contextmenu.selected.bg = '#${base0D}'

# Foreground color of the context menu's selected item. If set to null,
# the Qt default is used.
# Type: QssColor
c.colors.contextmenu.selected.fg = '#${base02}'

# Background color of disabled items in the context menu. If set to
# null, the Qt default is used.
# Type: QssColor
c.colors.contextmenu.disabled.bg = '#${base00}'

# Foreground color of disabled items in the context menu. If set to
# null, the Qt default is used.
# Type: QssColor
c.colors.contextmenu.disabled.fg = '#${base03}'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#${base00}'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = '#${base03}'

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = '#${base0B}'

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = '#${base03}'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#${base08}'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#${base0F}'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#${base01}'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#${base08}'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#${base07}'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#${base05}'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#${base03}'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = '#${base01}'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#${base01}'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#${base0F}'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#${base0F}'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#${base01}'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#${base08}'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#${base08}'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#${base01}'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#${base0C}'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#${base0C}'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#${base05}'

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '0px solid #${base0E}'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#${base00}'

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = '#${base0D}'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#${base03}'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#${base00}'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#${base01}'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#${base0B}'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#${base01}'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#${base0C}'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#${base01}'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#${base0F}'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#${base05}'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#${base00}'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#${base03}'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#${base0F}'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#${base00}'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#${base0F}'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#${base00}'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#${base0F}'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#${base0B}'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#${base0B}'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#${base0F}'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#${base0D}'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#${base03}'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#${base03}'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#${base0E}'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#${base00}'

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = '#${base0B}'

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = '#${base0A}'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#${base0F}'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#${base05}'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#${base00}'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#${base05}'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#${base00}'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#${base01}'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#${base0D}'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#${base01}'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#${base0D}'

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = '#${base05}'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = '#${base00}'

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = '#${base05}'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = '#${base00}'

# Foreground color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = '#${base01}'

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = '#${base0D}'

# Foreground color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.fg = '#${base01}'

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = '#${base0D}'
    '';
  };
}
