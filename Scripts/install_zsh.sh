#!/bin/bash

set -e

echo "Installing Zsh..."
sudo apt install -y zsh

echo "Setting Zsh as default shell..."
chsh -s "$(which zsh)"