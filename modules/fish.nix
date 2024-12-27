{ pkgs, config, lib, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      update = "nh os switch $HOME/nix/.";
      upgrade = "sudo nix-channel --update && \
        echo '\n> Nix-channel has been updated.\n' && \
        sudo nix flake update --flake $HOME/nix/. && \
        echo '\n> Flake has been updated.\n' && update";
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
