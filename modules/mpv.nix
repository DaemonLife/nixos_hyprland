{ pgks, config, pkgs, ... }: {
  programs.mpv = with config.lib.stylix.colors; {
    enable = true;

    bindings = {
      r = "cycle_values video-rotate 90 180 270 0";
      "Alt+c" = "script-binding uosc/chapters";
      "Alt+s" = "script-binding uosc/subtitles";
      "Alt+a" = "script-binding uosc/audio";
    };

    scripts = with pkgs; [
      mpvScripts.sponsorblock
      # mpvScripts.dynamic-crop # press 'C'
      # mpvScripts.crop # press 'C'
      mpvScripts.thumbfast # previews
      mpvScripts.mpris # for using standard media keys
      mpvScripts.autosubsync-mpv # press 'n' to sync subtitles
      mpvScripts.mpv-cheatsheet # press '?' and look keybinding in GUI
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
      sub-font = "Mononoki Nerd Font Regular";
      sub-bold = "yes";
      sub-font-size = 46;
      sub-border-size = 3;
      sub-auto = "fuzzy"; # subs that do not match file name perfectly.

      # lang
      slang = "ru,rus,en,eng,us"; # subtitle
      vlang = "en,eng,us,fr,de"; # video
      alang = "en,eng,us,fr,de"; # audio
      # youtube support
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      # performance and quality
      hwdec = "auto";
      cache = "yes";
      demuxer-max-back-bytes = "200000KiB";
      demuxer-max-bytes = "200000KiB";
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
      thumbfast = {
        spawn_first = true;
        network = true;
        hwdec = true;
      };
    };

  }; # program.mpv

  # other script
  home.file.".config/mpv/scripts/mpv-sub_not_forced_not_sdh.lua".text = ''
    function select_not_forced_subtitle()
        local last_sub = nil
        for i, sub in ipairs(mp.get_property_native("track-list")) do
        if sub.type == "sub" and (sub.lang:find("rus") or sub.lang:find("ru")) and not sub.forced and (sub.title == nil or not sub.title:find("SDH") and not string.lower(sub.title):find("force"))
        last_sub = sub
            end
        end
        if last_sub then
            mp.set_property("sid", last_sub.id)
        end
    end
    mp.register_event("file-loaded", select_not_forced_subtitle)
  '';
}
