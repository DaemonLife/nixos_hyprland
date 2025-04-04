{ pkgs, config, lib, ... }: {

  imports = [
    ./mako.nix
    ./fuzzel.nix
    ./hyprland.nix
    ./waybar.nix
    ./firefox.nix
    ./mpv.nix
    ./swaylock.nix
    ./telegram-theme.nix
    ./git.nix
    ./cmus.nix
    ./jrnl.nix
    ./fish.nix
    ./rtorrent.nix
    ./qutebrowser.nix
    ./gowall.nix
    ./qt.nix
    ./kitty.nix
    ./gtk.nix
    ./fzf.nix
    ./yazi.nix
    ./stylix.nix
    ./joplin-cli.nix
    # ./nixvim.nix
    ./helix.nix
    # ./sway.nix
    ./swayidle.nix
    # ./hypridle.nix
    # ./alacritty.nix
    # ./eww/eww.nix
    # ./lf/lf.nix
    # ./zsh.nix
    # ./ranger.nix
  ];

}
