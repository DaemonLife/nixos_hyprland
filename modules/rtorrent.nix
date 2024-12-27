{ pkgs, config, ... }: {

programs.rtorrent = {
    enable = true;
};
  home.file.".rtorrent.rc".text = '' 
## Instance layout (base paths)
method.insert = cfg.basedir,  private|const|string, (cat,'/home/user/Downloads')
  '';

}
