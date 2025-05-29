#!/bin/bash

set -e

echo "🔧 Starting dotfiles installation..."

# Define where this repo has been cloned (Codespaces will clone to a temp dir)
DOTFILES_SRC="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DEST="$HOME/dotfiles"

# Clone to ~/dotfiles if it's not already there
if [[ "$DOTFILES_SRC" != "$DOTFILES_DEST" ]]; then
  echo "📦 Copying dotfiles to $DOTFILES_DEST"
  cp -R "$DOTFILES_SRC" "$DOTFILES_DEST"
fi

# Export DOTFILES path for this session and future shells
export DOTFILES="$DOTFILES_DEST"
echo "export DOTFILES=\"$DOTFILES_DEST\"" >> "$HOME/.zshrc"

# Symlink dotfiles into home directory
echo "🔗 Linking dotfiles to $HOME"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/functions.zsh" "$HOME/functions.zsh"
ln -sf "$DOTFILES/aliases.zsh" "$HOME/aliases.zsh"
ln -sf "$DOTFILES/exports.zsh" "$HOME/exports.zsh"

# Optional: Symlink local config scripts (if present)
if [[ -f "$DOTFILES/local/codespaces.zsh" ]]; then
  ln -sf "$DOTFILES/local/codespaces.zsh" "$HOME/.codespaces.zsh"
fi

# Confirm
echo "✅ Dotfiles installed and linked."
echo "💡 Run 'source ~/.zshrc' to activate in current shell."
