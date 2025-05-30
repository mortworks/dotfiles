#!/bin/bash

# Set DOTFILES path if not already set
DOTFILES="${DOTFILES:-$PWD}"

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

# Ensure .zshrc is sourced on login
if [[ ! -f "$HOME/.zprofile" || ! "$(grep -F 'source ~/.zshrc' "$HOME/.zprofile")" ]]; then
  echo "source ~/.zshrc" >> "$HOME/.zprofile"
  echo "✅ Added 'source ~/.zshrc' to .zprofile"
elif [[ -f "$HOME/.profile" && ! "$(grep -F 'source ~/.zshrc' "$HOME/.profile")" ]]; then
  echo "source ~/.zshrc" >> "$HOME/.profile"
  echo "✅ Added 'source ~/.zshrc' to .profile"
fi

# Confirm
echo "✅ Dotfiles installed and linked."
echo "💡 Run 'source ~/.zshrc' to activate in current shell if needed."

# Source .zshrc if we're in a Zsh shell to apply the environment immediately
if [[ -n "$ZSH_VERSION" ]]; then
  echo "💡 Sourcing .zshrc to activate settings"
  source "$HOME/.zshrc"
fi

