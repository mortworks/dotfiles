#!/bin/bash

set -e  # Exit on error

echo "📦 Installing dotfiles..."

# Define the source and destination
DOTFILES_SRC="$(pwd)"
DOTFILES_DEST="$HOME/dotfiles"

# If not already at destination, copy the repo there
if [[ "$DOTFILES_SRC" != "$DOTFILES_DEST" ]]; then
  echo "📁 Copying dotfiles to $DOTFILES_DEST"
  cp -R "$DOTFILES_SRC" "$DOTFILES_DEST"
fi

# Export DOTFILES path
export DOTFILES="$DOTFILES_DEST"

# Symlink key config files into $HOME
echo "🔗 Linking config files to $HOME"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/functions.zsh" "$HOME/functions.zsh"
ln -sf "$DOTFILES/aliases.zsh" "$HOME/aliases.zsh"
ln -sf "$DOTFILES/exports.zsh" "$HOME/exports.zsh"

# Optional: symlink local config for Codespaces
if [[ -f "$DOTFILES/local/codespaces.zsh" ]]; then
  echo "🔗 Linking codespaces.zsh"
  ln -sf "$DOTFILES/local/codespaces.zsh" "$HOME/.codespaces.zsh"
fi

# Ensure ~/dotfiles/bin is executable and in PATH
if [[ ":$PATH:" != *":$DOTFILES/bin:"* ]]; then
  echo "➕ Adding $DOTFILES/bin to PATH"
  export PATH="$DOTFILES/bin:$PATH"
fi

# Set shell to zsh if available and not already default (and not in Codespaces)
if command -v zsh >/dev/null 2>&1 && [ "$SHELL" != "$(which zsh)" ]; then
  if [ -z "$CODESPACES" ]; then
    echo "⚙️  Changing default shell to zsh..."
    chsh -s "$(which zsh)" || echo "⚠️  Could not change default shell. Try manually if needed."
  else
    echo "ℹ️  Running in Codespaces — skipping shell change"
  fi
fi

echo "✅ Dotfiles install complete."
echo "💡 Run 'source ~/.zshrc' to activate immediately in this session."
