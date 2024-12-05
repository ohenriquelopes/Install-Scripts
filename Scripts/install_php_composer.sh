#!/bin/bash

set -e

echo "Installing PHP and Composer..."

# Instalar PHP
sudo apt update
sudo apt install -y php-cli php-curl php-mbstring

# Instalar Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
