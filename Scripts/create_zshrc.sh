#!/bin/bash

set -e

ZSHRC_PATH="$HOME/.zshrc"

ZSHRC_CONTENT=$(cat <<EOF
# Starship prompt initialization
eval "\$(starship init zsh)"

export PATH="\$PATH:/usr/local/go/bin"
export PATH="\$HOME/.config/composer/vendor/bin:\$PATH"

# Aliases
alias sail='sh \$([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias a='php artisan'
alias to='takeout'
alias ls='exa -la --icons'
alias cat='bat'

# Additional configurations (add yours below)
EOF
)

create_or_replace_zshrc() {
    echo "$ZSHRC_CONTENT" > "$ZSHRC_PATH"
    echo ".zshrc created successfully at $ZSHRC_PATH."
}

if [ -f "$ZSHRC_PATH" ]; then
    echo ".zshrc already exists at $ZSHRC_PATH."
    echo -n "Do you want to replace it? [y/N]: "
    read -r response

    if [[ "$response" =~ ^[Yy]$ ]]; then
        create_or_replace_zshrc
    else
        echo "Skipping .zshrc creation."
    fi
else
    create_or_replace_zshrc
fi