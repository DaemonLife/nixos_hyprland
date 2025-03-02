{ pkgs, config, ... }: {

  programs.git = {
    enable = true;
    userName = "DaemonLife";

    aliases = {
      acp = ''
        !f() { git add . && git commit -m "$*" && git push && echo '
        Push complited!'; }; f'';
    };
  };

}
