{ pkgs, config, lib, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      update = "nh os switch $HOME/nix/. -H $1";
      upgrade = "sudo nix-channel --update && \
        echo '\n> Nix-channel has been updated.\n' && \
        sudo nix flake update --flake $HOME/nix/. #$1 && \
        echo '\n> Flake has been updated.\n' && update $1";
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
