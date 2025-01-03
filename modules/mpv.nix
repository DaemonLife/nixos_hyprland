{ pgks, config, ... }: {
  programs.mpv = {

    enable = true;
    bindings = { };
    config = {

      #-General
      # player-operation-mode = "pseudo-gui";
      # ytdl-format = "bestvideo+bestaudio/best";

      #-Cache
      cache = "yes";
      # demuxer-max-bytes = "123400KiB";
      # demuxer-readahead-secs = 20;

      #-Decode Opts
      # vo = "gpu-next";
      # profile = "gpu-hq";
      # gpu-api = "opengl";
      hwdec = "auto-safe";

      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      # cache-default = 4000000;

      #-Scaling settings for profile=gpu-hq
      # scale = "ewa_lanczossharp";
      # scale-antiring = ".4";
      # cscale = "ewa_lanczossharp";
      # dscale = "ewa_robidoux";
      # dscale-param1 = 0;
      # dscale-param2 = 0;
      # dscale-antiring = 0;
      # correct-downscaling = "yes";
      # sigmoid-upscaling = "yes";

      #-Fiters
      # deband = "no";
      # interpolation = "no";
      # deinterlace = "no";
      # dither-depth = 8; # Set to your displays bitdepth.
      # dither = "fruit"; # default "fruit". Change to "ordered" if 10 or 12 bit display.

      #-Tweaks/UI
      fullscreen = "no";
      osd-font-size = 32;
      keep-open = "no";
      volume = 80;
      volume-max = 100;

      #-Subtitles
      sub-auto =
        "fuzzy"; # Allow loading external subs that do not match file name perfectly.
      slang = "ru,eng"; # Change to your preferred languages
      # sub-font = "Helvetica";
      sub-bold = "yes";
      sub-font-size = 40; # Change to your preferred sizes
      sub-border-size = 1;

      #-Video lang
      vlang = "en,us,fr,de";

      #-Screenshot
      screenshot-format = "png";
      screenshot-sw = "no"; # use software rendering
      screenshot-png-compression = 7; # range 0-9, higher values may lag
      screenshot-high-bit-depth = "yes";
      screenshot-directory =
        "~/Pictures/mpv-screenshots"; # insert directory between quote marks

      scripts = [
        # "/home/user/Downloads/dynamic-crop.lua"
      ];
    };
  };
}
