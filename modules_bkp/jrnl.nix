{ config, lib, pkgs, ... }: {

    home.file.".config/jrnl/jrnl.yaml".text = ''
        colors:
          body: none
          date: black
          tags: yellow
          title: cyan
        default_hour: 9
        default_minute: 0
        editor: hx
        encrypt: false
        highlight: true
        indent_character: '|'
        journals:
          default:
            journal: /home/user/.local/share/jrnl/journal.txt
        linewrap: 79
        tagsymbols: '#@'
        template: false
        timeformat: '%F %r'
        version: v4.1
    '';

}
