#!/bin/bash

set -e

# Função para instalar a fonte FiraCode Nerd Font
install_fira_code_nerd_font() {
    echo "Installing FiraCode Nerd Font..."

    # Criar uma pasta temporária para download
    TEMP_DIR=$(mktemp -d)
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip"
    FONT_ZIP="$TEMP_DIR/FiraCode.zip"

    # Baixar o arquivo ZIP
    echo "Downloading FiraCode Nerd Font..."
    curl -L -o "$FONT_ZIP" "$FONT_URL"

    # Extrair o ZIP
    echo "Extracting FiraCode Nerd Font..."
    unzip -q "$FONT_ZIP" -d "$TEMP_DIR/FiraCode"

    # Instalar os arquivos .ttf
    echo "Installing font files..."
    mkdir -p ~/.local/share/fonts
    find "$TEMP_DIR/FiraCode" -name "*.ttf" -exec cp {} ~/.local/share/fonts/ \;

    # Atualizar cache de fontes
    echo "Updating font cache..."
    fc-cache -f -v

    # Limpar arquivos temporários
    rm -rf "$TEMP_DIR"

    echo "FiraCode Nerd Font installed successfully!"
}

# Função para instalar o Starship
install_starship() {
    echo "Installing Starship prompt..."
    curl -fsSL https://starship.rs/install.sh | bash -s -- -y
}

# Executar as funções
install_fira_code_nerd_font
install_starship
