#!/bin/bash

# Simple symlink script
echo "Linking dotfiles to home directory..."

ln -sf "$PWD/.zshrc" "$HOME/.zshrc"

echo "Done. You can now open a new shell or 'source ~/.zshrc'"
