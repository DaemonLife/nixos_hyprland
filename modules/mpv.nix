{ pgks, config, pkgs, ... }: {
  programs.mpv = with config.lib.stylix.colors; {
    enable = true;

    bindings = {
      mbtn_right = "script-binding uosc/menu";
      # a = "script-binding uosc/stream-quality";
      "Ctrl+c" = "script-binding uosc/chapters";
      "Ctrl+s" = "script-binding uosc/subtitles";
      "Ctrl+a" = "script-binding uosc/audio";
    };

    scripts = with pkgs; [
      # mpvScripts.sponsorblock
      # mpvScripts.dynamic-crop # press 'C'
      # mpvScripts.crop # press 'C'
      mpvScripts.thumbfast # previews
      mpvScripts.mpris # for using standard media keys
      mpvScripts.autosubsync-mpv # press 'n' to sync subtitles
      mpvScripts.mpv-cheatsheet # press '?' and look keybinding in GUI
      # mpvScripts.modernx # new UI
      # mpvScripts.uosc # new UI
    ];

    config = {
      # ui settings
      osc = true; # false for disable default ui
      osd-bar = true; # false for disable default ui
      border = false;
      fullscreen = "no";
      # osd-font = "";
      osd-font-size = 30;
      keep-open = "no";
      volume = 80;
      volume-max = 100;
      # sub-font = "Helvetica";
      sub-bold = "yes";
      sub-font-size = 30;
      sub-border-size = 1;

      # lang
      slang = "ru,en,eng,us"; # subtitle
      vlang = "en,eng,us,fr,de"; # video
      alang = "en,eng,us,fr,de"; # audio
      sub-auto = "fuzzy"; # subs that do not match file name perfectly.
      # youtube support
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";

      # performance and quality
      # hwdec = "auto";
      # cache = "yes";
      # demuxer-max-back-bytes = 10000000000;
      # demuxer-max-bytes = 10000000000;
      # interpolation = true;
      # video-sync = "display-resample";

      # other
      save-position-on-quit = true;

      # Screenshot
      screenshot-format = "png";
      screenshot-sw = "no"; # use software rendering
      screenshot-png-compression = 7; # range 0-9, higher values may lag
      screenshot-high-bit-depth = "yes";
      screenshot-directory = "~/Pictures/mpv-screenshots";
    }; # end of config

    scriptOpts = {
      uosc = {
        # Display style of current position. available: line, bar
        timeline_style = "bar";
        timeline_line_width = 4;
        # Top border of background color to help visually separate timeline from video
        timeline_border = 3;
        # Timeline size when fully expanded, in pixels, 0 to disable
        timeline_size = 16;
        timeline_persistency = "paused,audio";
        # Render cache indicators for streaming content
        timeline_cache = true;
        progress = "never";
        # progress_size = 4;
        # progress_line_width = 4;
        controls =
          "menu,gap,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,gap,space,shuffle,loop-playlist,loop-file,gap,prev,items,next,gap";
        controls_size = 24;
        controls_margin = 8;
        controls_spacing = 2;
        # Where to display volume controls: none, left, right
        volume = "right";
        volume_size = 24;
        volume_border = 1;
        volume_step = 1;
        # Controls all menus, such as context menu, subtitle loader/selector, etc
        menu_item_height = 24;
        menu_min_width = 260;
        menu_padding = 4;
        # Can be: never, no-border, always
        top_bar = "no-border";
        top_bar_size = 24;
        # close button and etc
        top_bar_controls = "no";
        # Flash top bar when any of these file types is loaded. Available: audio,video,image,chapter
        top_bar_flash_on = "video,audio";
        # Window border drawn in no-border mode
        window_border_size = 0;
        # auto run next files in directory
        autoload = true;
        shuffle = false;
        # Scale the interface by this factor
        scale = 2;
        # Scale in fullscreen
        scale_fullscreen = 2;
        # Adjust the text scaling to fit your font
        font_scale = 3;
        # Border of text and icons when drawn directly on top of video
        text_border = 1.2;
        # Border radius of buttons, menus, and all other rectangles
        border_radius = 0;
        # Duration of animations in milliseconds
        animation_duration = 100;
        # Adjusted osd margins based on the visibility of UI elements
        adjust_osd_margins = true;
        refine = "text_width";
        color = [
          "foreground = ${base05}"
          "foreground_text = ${base00}"
          "background = ${base0E}"
          "background_text = ${base05}"
          "curtain = ${base01}"
          "success = ${base0B}"
          "error = ${base08}"
        ];
      };
      thumbfast = {
        spawn_first = true;
        network = true;
        hwdec = true;
      };
    };

  };
}
