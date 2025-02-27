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
    ./lf.nix
    ./fish.nix
    ./rtorrent.nix
    ./qutebrowser.nix
    ./gowall.nix
    ./qt.nix
    ./kitty.nix
    ./gtk.nix
    ./helix.nix
    ./fzf.nix
    ./yazi.nix
    ./stylix.nix
    # ./nixvim.nix
    # ./zsh.nix
    # ./ranger.nix
  ];

}
