#!/bin/bash

set -e

# Instalar o Rust se não estiver instalado
if ! command -v rustup &>/dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Instalar ferramentas CLI baseadas em Rust
echo "Installing Rust CLI tools: bat, exa, procs, dust, tokei..."
cargo install bat exa procs dust tokei
