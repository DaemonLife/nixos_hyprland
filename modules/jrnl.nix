{ lib, ... }:
let
  conf = ''
    colors:
      body: none
      date: white 
      tags: blue 
      title: cyan
    default_hour: 9
    default_minute: 0
    editor: hx 
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
  '';
in
{

  home.activation.jrnl_conf = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    cd $HOME/.config && mkdir jrnl;
    cd jrnl;
    touch jrnl.yaml;
    echo "${conf}" > jrnl.yaml

  '';

  # home.file.".config/jrnl/default.nix".text = ''
  #   { config, pkgs, ... }: {}
  # '';
  # home.file.".config/jrnl/jrnl.yaml".text = # yaml
  #   ''
  #     colors:
  #       body: none
  #       date: white 
  #       tags: blue 
  #       title: cyan
  #     default_hour: 9
  #     default_minute: 0
  #     editor: ${editor} 
  #     encrypt: false
  #     highlight: true
  #     indent_character: '|'
  #     journals:
  #       default:
  #         journal: $HOME/.local/share/jrnl/journal.txt
  #       main:
  #         journal: /mnt/temp/jrnl/jrnl.txt
  #     linewrap: 79
  #     tagsymbols: '#@'
  #     template: false
  #     timeformat: '%Y-%m-%d %H:%M'
  #   '';

}
