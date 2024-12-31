# nixos_hyprland
My first Hyprland setup on NixOS

## Preparing
1. Change username "user" in configs if you use other name. Also change hostname if you need. I use "nixos". 
2. Place all configs to /home/[your_user]/nix and open this nix folder.

## Install
I have two configurated devices:
- GPD pocket 3 ("gpd-pocket-3")
- IdeaPad 5 Pro 14ACN ("lenovo")

For Lenovo run:
nixos-rebuild switch --flake . #lenovo
For GPD:
nixos-rebuild switch --flake . #gpd-pocket-3

If you use other then for quickly start I recommend you remove file .../nix/devices/lenovo/hardware-configuration.nix and after all run:
nixos-rebuild switch --flake . #lenovo

Reboot. Done.

## Using
For rebuild use "update [device]", for update and rebuild - "upgrade [device]"

## Tips
To set up your Telegram auto-update theme, follow these steps:
1. Open "Settings/Chat Settings" in Telegram Desktop application.
2. Click on the three dots in the top right corner and select "Create theme".
3. Choose "Import existing theme" and select the file (available after the first home build) in "~/.config/telegram-base16.tdesktop-theme".
