{ pkgs, config, lib, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      # update [device]
      update = "nh os switch $HOME/nix/. -H $1";
      upgrade = "nh os switch -u $HOME/nix -H $1";

      # for windows fs on lenovo
      cdwin = "source $HOME/nix/scripts/cdwin.fish";

      # battery configuration will be restored at the next boot
      tlp_full = "sudo tlp fullcharge bat1";
      tlp_conserv = "sudo tlp setcharge bat1";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; } # colors
    ];
    shellInit = "";
    loginShellInit = "";
};
}
