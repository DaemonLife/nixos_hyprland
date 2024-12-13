# nixos_hyprland
My first Hyprland setup on NixOS

## Install
1. Remove hardware-configuration.nix file. It will be generate auto.
2. Change username "user" in configs if you use other name. Also change hostname if you need. I use "nixos". 
3. Place all configs to /home/[your_user]/nix
4. Run command in this folder: nixos-rebuild switch --flake .

## Tips
To set up your Telegram auto-update theme, follow these steps:
1. Open "Settings/Chat Settings" in Telegram Desktop application.
2. Click on the three dots in the top right corner and select "Create theme".
3. Choose "Import existing theme" and select the file (available after the first home build) in "~/.config/telegram-base16.tdesktop-theme".
