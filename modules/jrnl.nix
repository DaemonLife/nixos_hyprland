{ config, pkgs, ... }:
let editor = "hx";
in {

  home.file.".config/jrnl/default.nix".text = ''
    { config, pkgs, ... }: {}
  '';
  home.file.".config/jrnl/jrnl.yaml".text = ''
    colors:
      body: none
      date: white 
      tags: blue 
      title: cyan
    default_hour: 9
    default_minute: 0
    editor: ${editor} 
    encrypt: false
    highlight: true
    indent_character: '|'
    journals:
      default:
        journal: $HOME/.local/share/jrnl/journal.txt
      main:
        journal: /mnt/temp/jrnl/jrnl.txt
    linewrap: 79
    tagsymbols: '#@'
    template: false
    timeformat: '%Y-%m-%d %H:%M'
    version: v4.1
  '';

}
