#!/bin/bash

if ! grep -q "ID_LIKE=arch\|ID=arch" /etc/os-release; then
  echo "This script is intended for arch based distros only. For your safety, the script will stop now."
  echo "If you are on an arch based distro and you've seen this message, e-mail yasmin@snowfloke.com!"
  exit 1
fi

if ! command -v yay &>/dev/null; then
  echo "yay not found, needed for some packages, installing now..."
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
fi

DESTINATION="$HOME/.config"
CONFIG_ORIGIN="$HOME/dotfiles/configs"
SHELL_ORIGIN="$HOME/dotfiles/shell"
FONTS_ORIGIN="$HOME/dotfiles/assets/fonts"
WALLPAPER_ORIGIN="$HOME/dotfiles/assets/wallpaper"
THEME_ORIGIN="$HOME/dotfiles/assets/icons"
ALT_THEME_ORIGIN="$HOME/dotfiles/assets/alt-icons"

PACKAGES=(
  hyprland
  noctalia-shell
  evtest
  nautilus
  kitty
  flatpak
  vencord
  spicetify
  neovim
  yazi
  zen-browser-bin
)

yay -S --needed --noconfirm "${PACKAGES[0]}"

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

if [ -d "$THEME_ORIGIN" ]; then
  mkdir -p "$HOME/.local/share/icons"
  cp -rf "$THEME_ORIGIN" "$HOME/.local/share/"
fi

if [ -d "$ALT_THEME_ORIGIN" ]; then
  sudo mkdir -p /usr/share/icons
  sudo cp -rf "$ALT_THEME_ORIGIN" /usr/share/icons
fi

echo "Installed dotfiles! Restart your machine"
echo "and select Hyprland on your display manager to proceed!"
