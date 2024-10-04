{ pkgs, config, ... }: {

programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
        rg = "ranger";
        flake-rebuild = "\
        sudo nixos-rebuild switch --flake \"/home/user/nix/.\" && \
        echo '\n> Complited. The flake has been rebuilded.'";
        
        flake-upgrade = "\
        sudo nix-channel --update && \
        echo '\n> Nix-channel has been updated.\n' && \
        sudo nix flake update \"/home/user/nix/.\" && \
        echo '\n> Flake has been updated.\n' && flake-rebuild";
        
        home-rebuild = "\
        home-manager switch --flake \"/home/user/nix/.\" && hyprctl reload && \
        echo '> Home-manager has been switch. Hyprland reloaded.'";
        
        mwin = "sudo mount /dev/nvme0n1p3 /mnt/windows -t ntfs3";
        cdwin = "cd /mnt/windows/Users/user";
    };

    oh-my-zsh = {
        enable = true;
        theme = "frisk";
        plugins = [
            "git"
        ];
    };
};
}
