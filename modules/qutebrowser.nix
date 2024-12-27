{ pkgs, config, ... }: {

  programs.qutebrowser = with config.lib.stylix.colors; {
    enable = true;
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

    extraConfig = ''
config.load_autoconfig()
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; rv:107.0) Gecko/20100101 Firefox/107.0'
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']
# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ['#ebdbb2', '#8ec07c', '#fabd2f']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#282828'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#282828'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#83a598'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#3c3836'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#3c3836'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#3c3836'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#fbf1c7'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#7c6f64'

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#504945'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#504945'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#fe8019'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#fe8019'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#fbf1c7'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#3c3836'

# Background color of the context menu. If set to null, the Qt default
# is used.
# Type: QssColor
c.colors.contextmenu.menu.bg = '#282828'

# Foreground color of the context menu. If set to null, the Qt default
# is used.
# Type: QssColor
c.colors.contextmenu.menu.fg = '#d5c4a1'

# Background color of the context menu's selected item. If set to null,
# the Qt default is used.
# Type: QssColor
c.colors.contextmenu.selected.bg = '#504945'

# Foreground color of the context menu's selected item. If set to null,
# the Qt default is used.
# Type: QssColor
c.colors.contextmenu.selected.fg = '#d5c4a1'

# Background color of disabled items in the context menu. If set to
# null, the Qt default is used.
# Type: QssColor
c.colors.contextmenu.disabled.bg = '#665c54'

# Foreground color of disabled items in the context menu. If set to
# null, the Qt default is used.
# Type: QssColor
c.colors.contextmenu.disabled.fg = '#bdae93'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#282828'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = '#282828'

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = '#83a598'

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = '#282828'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#8ec07c'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#fb4934'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#282828'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = 'rgba(250, 191, 47, 200)'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#7c6f64'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#a89984'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#fbf1c7'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = '#282828'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#282828'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#fb4934'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#fb4934'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#282828'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#d3869b'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#d3869b'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#d5c4a1'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#282828'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#282828'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#d5c4a1'

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid #3c3836'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#665c54'

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = '#504945'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#d5c4a1'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#282828'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#282828'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#689d6a'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#282828'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#458588'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#d3869b'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#282828'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#bdae93'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#3c3836'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#d3869b'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#3c3836'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#282828'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#b16286'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#282828'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#d3869b'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#83a598'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#a89984'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#cc241d'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#fe8019'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#fb4934'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#fbf1c7'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#d3869b'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#282828'

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = '#83a598'

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = '#8ec07c'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#fb4934'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#d5c4a1'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#504945'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#d5c4a1'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#665c54'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#d5c4a1'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#282828'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#d5c4a1'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#282828'

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = '#504945'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = '#b8bb26'

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = '#504945'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = '#b8bb26'

# Foreground color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = '#d5c4a1'

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = '#282828'

# Foreground color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.fg = '#d5c4a1'

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = '#282828'

# Value to use for `prefers-color-scheme:` for websites. The "light"
# value is only available with QtWebEngine 5.15.2+. On older versions,
# it is the same as "auto". The "auto" value is broken on QtWebEngine
# 5.15.2 due to a Qt bug. There, it will fall back to "light"
# unconditionally.
# Type: String
# Valid values:
#   - auto: Use the system-wide color scheme setting.
#   - light: Force a light theme.
#   - dark: Force a dark theme.
c.colors.webpage.preferred_color_scheme = 'dark'
    '';
  };
}
