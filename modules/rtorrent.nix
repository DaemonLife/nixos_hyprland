{ pkgs, config, ... }: {

  programs.rtorrent = { enable = true; };
  home.file.".rtorrent.rc".text = ''
    method.insert = cfg.basedir,  private|const|string, (cat,"/home/user/Downloads/rtorrent/")
    method.insert = cfg.download, private|const|string, (cat,(cfg.basedir),"download/")
    method.insert = cfg.logs,     private|const|string, (cat,(cfg.basedir),"log/")
    method.insert = cfg.logfile,  private|const|string, (cat,(cfg.logs),"rtorrent-",(system.time),".log")
    method.insert = cfg.session,  private|const|string, (cat,(cfg.basedir),".session/")
    method.insert = cfg.watch,    private|const|string, (cat,(cfg.basedir),"watch/")

    ## Create instance directories
    execute.throw = sh, -c, (cat,\
        "mkdir -p \"",(cfg.download),"\" ",\
        "\"",(cfg.logs),"\" ",\
        "\"",(cfg.session),"\" ",\
        "\"",(cfg.watch),"/load\" ",\
        "\"",(cfg.watch),"/start\" ")

    ## Basic operational settings (no need to change these)
    session.path.set = (cat, (cfg.session))
    directory.default.set = (cat, (cfg.download))
    log.execute = (cat, (cfg.logs), "execute.log")
    #log.xmlrpc = (cat, (cfg.logs), "xmlrpc.log")
    execute.nothrow = sh, -c, (cat, "echo >",\
        (session.path), "rtorrent.pid", " ",(system.pid))

    encoding.add = UTF-8
    pieces.hash.on_completion.set = yes
  '';

}
