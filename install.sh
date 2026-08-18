#!/bin/bash
sudo pacman -S hyprland  hyprlock hypridle \
quickshell qt6-5compat \
firefox brightnessctl alacritty grim slurp 

sudo pacman -S sof-firmware alsa-firmware alsa-utils pipewire-alsa pipewire-audio pipewire wireplumber rtkit alsa-utils 
sudo systemctl enable --now rtkit-daemon && systemctl --user enable --now wireplumber 