#!/bin/bash

set -e

echo "Installing Flathub..."
sudo apt install -y flatpak
sudo apt install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak update
