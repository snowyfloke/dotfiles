#!/bin/bash

DESTINATION = "$HOME/.config"
CONFIG_ORIGIN = "$HOME/dotfiles/configs"
SHELL_ORIGIN = "$HOME/dotfiles/shell"
FONTS_ORIGIN = "$HOME/dotfiles/assets/fonts"
WALLPAPER_ORIGIN = "$HOME/dotfiles/assets/wallpaper"

for config in "$CONFIG_ORIGIN"; do
  src="$CONFIG_ORIGIN/$config"
  if [ -e "$src" ]; then
    cp -rf "$src" "$DESTINATION/$config"
  fi
done

for file in "$SHELL_ORIGIN"; do
  src="SHELL_ORIGIN/$file"
  if [ -f "$src" ]; then
    cp -rf "$src" "$HOME/$file"
  fi
done

if [ -d "$FONTS_ORIGIN" ]; then
  mkdir -p "$HOME/.local/share/fonts"
  cp -rf "$FONTS_ORIGIN" "$HOME/.local/share/fonts"
fi

if [ -d "$WALLPAPER_ORIGIN" ]; then
  mkdir -p "$HOME/wallpaper"
  cp -rf "$WALLPAPER_ORIGIN" "$HOME/wallpaper"
fi

echo "Installed dotfiles! Restart your machine"
echo "and select Hyprland on your display manager to proceed!"
