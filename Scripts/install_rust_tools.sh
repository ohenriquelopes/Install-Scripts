#!/bin/bash

set -e

if ! command -v rustup &>/dev/null; then
    echo "Installing Rust..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi

echo "Installing Rust CLI tools: bat, exa, procs, dust, tokei..."
cargo install bat exa procs du-dust tokei