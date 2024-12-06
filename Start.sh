#!/bin/bash

set -e # Finish script if any command fails

function ask_to_install() {
    echo -n "Do you want to install $1? [Y/n]: "
    read -r response
    if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

function install_dependencies() {
    echo "Updating system and installing common dependencies..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y curl git build-essential unzip fontconfig
}

SCRIPTS_DIR="./Scripts"

INSTALL_COMPOSER=false
INSTALL_ZSH=false

function run_script() {
    local script=$1
    local dependency=$2

    if [ "$dependency" = "composer" ] && [ "$INSTALL_COMPOSER" = false ]; then
        echo "Skipping $script (requires Composer)."
        return
    fi

    if [ "$dependency" = "zsh" ] && [ "$INSTALL_ZSH" = false ]; then
        echo "Skipping $script (requires Zsh)."
        return
    fi

    if ask_to_install "$(basename "$script" .sh)"; then
        bash "$script"
    fi
}

install_dependencies

if ask_to_install "Zsh"; then
    bash "$SCRIPTS_DIR/install_zsh.sh"
    INSTALL_ZSH=true
fi

if [ "$INSTALL_ZSH" = true ]; then
    if ask_to_install "Starship"; then
        bash "$SCRIPTS_DIR/install_starship.sh"
        bash "$SCRIPTS_DIR/create_zshrc.sh"
    fi
fi

if ask_to_install "Composer"; then
    bash "$SCRIPTS_DIR/install_php_composer.sh"
    INSTALL_COMPOSER=true
fi

if [ "$INSTALL_COMPOSER" = true ]; then
    if ask_to_install "Takeout"; then
        bash "$SCRIPTS_DIR/install_takeout.sh"
    fi
fi

run_script "$SCRIPTS_DIR/install_rust_tools.sh"
run_script "$SCRIPTS_DIR/install_docker.sh"
run_script "$SCRIPTS_DIR/install_flathub.sh"

echo "Setup complete!"
