#!/usr/bin/env bash

# Interrompe o script se qualquer comando falhar
set -e

echo "=== Iniciando a instalação do ambiente Hyprland ==="

# 1. Atualizar o sistema e instalar dependências básicas do Arch
echo "-> Atualizando o sistema e instalando dependências base..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel

# 2. Verificar e instalar um gerenciador da AUR (yay)
if ! command -v yay &>/dev/null; then
  echo "-> O gerenciador AUR 'yay' não foi encontrado. Instalando..."
  SRC_DIR="$HOME/src"
  mkdir -p "$SRC_DIR"

  # Clona e compila o yay a partir do AUR
  git clone https://aur.archlinux.org/yay-bin.git "$SRC_DIR/yay-bin"
  cd "$SRC_DIR/yay-bin"
  makepkg -si --noconfirm
  cd -
else
  echo "-> 'yay' já está instalado. Pulando esta etapa."
fi

# 3. Instalar pacotes oficiais e da AUR
# Defina aqui os pacotes exatos que sua interface utiliza
PACKAGES=(
  hyprland
  hyprfm
  hyprshot
  btop
  yazi
  fastfetch
  noctalia-shell
  evtest
  uswm
  neovim
  jq
  glib2
  xdg-utils
  niri
  rose-pine-hyprcursor
  rose-pine-cursor
  rose-pine-gtk-theme-full
  ghostty
  fcitx5 # needed so ghostty works correctly with us-intl layout
)

echo "-> Instalando os pacotes necessários..."
yay -S --needed --noconfirm "${PACKAGES[@]}"

# 4. Copiar as configurações e wallpapers do repositório
echo "-> Copiando arquivos de configuração..."

# Garante que a pasta ~/.config existe
mkdir -p "$HOME/.config"

# Copia as pastas de configuração do repositório para o diretório local
# O comando pressupõe que você está executando o script de dentro da pasta do repositório clonado
if [ -d ".config" ]; then
  cp -r .config/* "$HOME/.config/"
else
  echo "Aviso: Pasta .config não encontrada no repositório local."
fi

if [ -d "$HOME/.local"]; then
  cp -r scripts $HOME/.local/bin
else
  mkdir $HOME/.local
fi

# Copiar wallpapers (exemplo: se você guardá-los em uma pasta chamada 'wallpapers' no repositório)
if [ -d "wallpapers" ]; then
  echo "-> Copiando wallpapers..."
  mkdir -p "$HOME/Pictures/wallpapers"
  cp -r wallpapers/* "$HOME/Pictures/wallpapers/"
fi

echo "=== Instalação concluída com sucesso! ==="
echo "Reinicie a sessão ou execute 'Hyprland' para iniciar."
