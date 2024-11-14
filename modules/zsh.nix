{ pkgs, config, lib, ... }: {

programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
        # nix aliases
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
       
        # for windows fs
        mwin = "sudo mount /dev/nvme0n1p3 /mnt/windows -t ntfs";
        cdwin = "cd /mnt/windows/Users/user 2>/dev/null || (echo 'Mounting win fs...' && mwin && echo '> Mount win is done' && cd /mnt/windows/Users/user)";

        # battery configuration will be restored at the next boot
        tlp_full = "sudo tlp fullcharge bat1";
        tlp_conserv = "sudo tlp setcharge bat1";
    };

    oh-my-zsh = {
        enable = true;
        plugins = [
            "git"
        ];
    };
    
    # my theme for zsh + oh-my-zsh
    initExtra = ''
      source $HOME/nix/themes/my.zsh-theme;
    '';
};

home.file."/home/user/nix/themes/my.zsh-theme".text = ''
PROMPT=$'
%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)%{$fg[white]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}
%{$fg_bold[white]%}>%{$reset_color%} '

PROMPT2="%{$fg_bold[white]%}%_> %{$reset_color%}"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
'';

}
