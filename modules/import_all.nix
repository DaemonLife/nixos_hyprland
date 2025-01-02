{ pkgs, config, lib, ... }: {

  imports = [
    ./mako.nix
    ./fuzzel.nix
    ./hyprland.nix
    ./alacritty.nix
    ./waybar.nix
    ./firefox.nix
    ./mpv.nix
    ./hypridle.nix
    ./swaylock.nix
    ./telegram-theme.nix
    ./git.nix
    ./cmus.nix
    ./jrnl.nix
    ./nixvim.nix
    ./lf.nix
    ./fish.nix
    ./fzf.nix
    ./rtorrent.nix
    ./qutebrowser.nix
    ./gowall.nix
    # ./kitty.nix
    # ./gtk.nix
    # ./zsh.nix
    # ./helix.nix
    # ./ranger.nix
  ];

}
