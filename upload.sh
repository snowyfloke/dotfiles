#!/bin/bash

DESTINATION="$HOME/dotfiles"
CONFIG_ORIGIN="$HOME/.config"

rm -rf $DESTINATION/configs $DESTINATION/assets $DESTINATION/scripts $DESTINATION/shell

INCLUDED_CONFIGS=(
  hypr
  btop
  qt5ct
  fastfetch
  hypremoji
  kitty
  yazi
  starship.toml
  starship-preset.toml
  gtk-3.0
  gtk-4.0
  nvim
  noctalia
  noctalia.json
)
mkdir -p "$HOME/dotfiles/configs"
for entry in "${INCLUDED_CONFIGS[@]}"; do
  src="$CONFIG_ORIGIN/$entry"
  if [ -e "$src" ]; then
    cp -rf "$src" "$DESTINATION/configs/$entry"
  fi
done

mkdir -p "$DESTINATION/shell"

SHELL_FILES=(
  .zshrc
  .zprofile
  .zshenv
  .bashrc
  .bash_profile
  .profile
  .inputrc
  .gitconfig
  .gitignore_global
)

for file in "${SHELL_FILES[@]}"; do
  src="$HOME/$f"
  if [ -f "$src" ]; then
    cp -rf "$src" "$DESTINATION/shell/$file"
  fi
done

FONTS_SRC="$HOME/.local/share/fonts"
if [ -d "$FONTS_SRC" ]; then
  mkdir -p "$DESTINATION/assets"
  cp -rf "$FONTS_SRC" "$DESTINATION/assets/"
  FONT_COUNT=$(find "$DESTINATION/assets/fonts" -type f | wc -l)
  echo "$FONT_COUNT fonts found"
else
  echo "No fonts found in $FONTS_SRC, is it still the right path?"
fi

THEMES_SRC="$HOME/.local/share/icons"
THEMES_ALT_SRC="/usr/share/icons"
if [ -d "$THEMES_SRC" ]; then
  mkdir -p "$DESTINATION/assets"
  cp -rf "$THEMES_SRC" "$DESTINATION/assets/"
  TH_COUNT=$(find "$DESTINATION/assets/icons" -type f | wc -l)
  echo "$TH_COUNT themes found"
else
  echo "No themes found in $THEMES_SRC, is it still the right path?"
fi
if [ -d "$THEMES_ALT_SRC" ]; then
  mkdir -p "$DESTINATION/assets/alt-icons"
  cp -rf "$THEMES_ALT_SRC" "$DESTINATION/assets/alt-icons"
  ALT_TH_COUNT=$(find "$DESTINATION/assets/alt-icons" -type f | wc -l)
  echo "$ALT_TH_COUNT themes found"
else
  echo "No wallpapers found in $THEMES_ALT_SRC, is it still the right path?"
fi

WALLPAPER_SRC="$HOME/wallpaper"
if [ -d "$WALLPAPER_SRC" ]; then
  mkdir -p "$DESTINATION/assets"
  cp -rf "$WALLPAPER_SRC" "$DESTINATION/assets/"
  WP_COUNT=$(find "$DESTINATION/assets/wallpaper" -type f | wc -l)
  echo "$WP_COUNT wallpapers found"
else
  echo "No wallpapers found in $WALLPAPER_SRC, is it still the right path?"
fi

SCRIPTS_DIR="$HOME/scripts"
if [ -d "$SCRIPTS_DIR" ]; then
  cp -rf "$SCRIPTS_DIR" "$DESTINATION"
else
  echo "No scripts found in $SCRIPTS_DIR, is it still the right path?"
fi

echo "Updating github repo..."
CURRENT_DIR=$(pwd)

if [ "$HOME/dotfiles" == "$CURRENT_DIR" ]; then
  git add .
  git commit -m "Updated dotfiles ($(date +%F))"
  git push
else
  cd $HOME/dotfiles
  git add .
  git commit -m "Updated dotfiles ($(date +%F))"
  git push
  cd "$CURRENT_DIR"
fi
unset "$CURRENT_DIR"

echo "Update ready!"
