#!/bin/bash

set -e

echo "Installing Takeout..."
composer global require "tightenco/takeout:~2.8"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
