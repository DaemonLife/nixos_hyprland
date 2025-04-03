{ config, lib, pkgs, ... }: {
  programs.cmus = {
    enable = true;
    extraConfig = ''
      # colors
      set color_cmdline_attr=default
      set color_cmdline_bg=default
      set color_cmdline_fg=231
      set color_cur_sel_attr=gray
      set color_error=lightred
      set color_info=231
      set color_separator=blue
      set color_statusline_attr=default
      set color_statusline_bg=default
      set color_statusline_fg=231
      set color_titleline_attr=default
      set color_titleline_bg=lightgreen
      set color_titleline_fg=236
      set color_trackwin_album_attr=bold
      set color_trackwin_album_bg=default
      set color_trackwin_album_fg=default
      set color_win_attr=default
      set color_win_bg=default
      set color_win_cur=lightgreen
      set color_win_cur_attr=default
      set color_win_cur_sel_attr=gray
      set color_win_cur_sel_bg=lightgreen
      set color_win_cur_sel_fg=gray
      set color_win_dir=blue
      set color_win_fg=blue
      set color_win_inactive_cur_sel_attr=white
      set color_win_inactive_cur_sel_bg=default
      set color_win_inactive_cur_sel_fg=white
      set color_win_inactive_sel_attr=white
      set color_win_inactive_sel_bg=default
      set color_win_inactive_sel_fg=gray
      set color_win_sel_attr=default
      set color_win_sel_bg=blue
      set color_win_sel_fg=black
      set color_win_title_attr=default
      set color_win_title_bg=default
      set color_win_title_fg=cyan

      # binds. -f means overwrite conflicts.
      bind -f common n player-next
      bind -f common p player-prev
      bind -f common c toggle continue
      bind -f common space player-pause
      bind -f common q quit
    '';
  };
}
