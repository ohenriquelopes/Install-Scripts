#!/bin/bash

set -e

install_fira_code_nerd_font() {
    echo "Installing FiraCode Nerd Font..."

    TEMP_DIR=$(mktemp -d)
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip"
    FONT_ZIP="$TEMP_DIR/FiraCode.zip"

    echo "Downloading FiraCode Nerd Font..."
    curl -L -o "$FONT_ZIP" "$FONT_URL"

    echo "Extracting FiraCode Nerd Font..."
    unzip -q "$FONT_ZIP" -d "$TEMP_DIR/FiraCode"

    echo "Installing font files..."
    mkdir -p ~/.local/share/fonts
    find "$TEMP_DIR/FiraCode" -name "*.ttf" -exec cp {} ~/.local/share/fonts/ \;

    echo "Updating font cache..."
    fc-cache -f -v

    rm -rf "$TEMP_DIR"

    echo "FiraCode Nerd Font installed successfully!"
}

install_starship() {
    echo "Installing Starship prompt..."
    curl -fsSL https://starship.rs/install.sh | sh
    starship preset nerd-font-symbols -o ~/.config/starship.toml
}

install_fira_code_nerd_font
install_starship
