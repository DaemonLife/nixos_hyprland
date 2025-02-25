{ pkgs, config, ... }: {

  programs.git = {
    enable = true;
    userName = "DaemonLife";

    aliases = {
      ac = ''!f() { git add . && git commit -m "$1" && git push; }; f'';
    };
  };

}
