#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "📦 Installing dotfiles..."

# ----------------------------------------
# Define source and destination
# ----------------------------------------
DOTFILES_SRC="$(pwd)"
DOTFILES_DEST="$HOME/dotfiles"

# ----------------------------------------
# Copy to expected location if needed
# ----------------------------------------
if [[ "$DOTFILES_SRC" != "$DOTFILES_DEST" ]]; then
  echo "📁 Copying dotfiles to $DOTFILES_DEST"
  cp -R "$DOTFILES_SRC" "$DOTFILES_DEST"
fi

# ----------------------------------------
# Export DOTFILES path for this session
# ----------------------------------------
export DOTFILES="$DOTFILES_DEST"

# ----------------------------------------
# Symlink key config files into $HOME
# ----------------------------------------
echo "🔗 Linking config files to $HOME"
ln -sf "$DOTFILES/.zshrc"         "$HOME/.zshrc"
ln -sf "$DOTFILES/functions.zsh"  "$HOME/functions.zsh"
ln -sf "$DOTFILES/aliases.zsh"    "$HOME/aliases.zsh"
ln -sf "$DOTFILES/exports.zsh"    "$HOME/exports.zsh"

# ----------------------------------------
# Optionally link Codespaces config
# ----------------------------------------
if [[ -f "$DOTFILES/local/codespaces.zsh" ]]; then
  echo "🔗 Linking codespaces.zsh"
  ln -sf "$DOTFILES/local/codespaces.zsh" "$HOME/.codespaces.zsh"
fi

# ----------------------------------------
# Ensure bin scripts are executable
# ----------------------------------------
if [[ -d "$DOTFILES/bin" ]]; then
  echo "🔐 Making scripts in $DOTFILES/bin executable"
  chmod +x "$DOTFILES/bin/"* 2>/dev/null || true
fi

# ----------------------------------------
# Add dotfiles/bin to PATH for this session
# ----------------------------------------
if [[ ":$PATH:" != *":$DOTFILES/bin:"* ]]; then
  echo "➕ Adding $DOTFILES/bin to PATH"
  export PATH="$DOTFILES/bin:$PATH"
fi

# ----------------------------------------
# 🧰 Ensure workflow-tools is cloned
# ----------------------------------------
WORKFLOW_DIR="/workspaces/mortworks/workflow-tools"

if [[ -n "$CODESPACES" && ! -d "$WORKFLOW_DIR" ]]; then
  echo "📥 Cloning workflow-tools to $WORKFLOW_DIR"
  mkdir -p "$(dirname "$WORKFLOW_DIR")"
  git clone https://github.com/mortworks/workflow-tools.git "$WORKFLOW_DIR"
else
  echo "✅ workflow-tools already present or not in Codespaces"
fi

# ----------------------------------------
# Set default shell to zsh if appropriate
# ----------------------------------------
if command -v zsh >/dev/null 2>&1 && [ "$SHELL" != "$(which zsh)" ]; then
  if [ -z "$CODESPACES" ]; then
    echo "⚙️  Changing default shell to zsh..."
    chsh -s "$(which zsh)" || echo "⚠️  Could not change default shell. Try manually if needed."
  else
    echo "ℹ️  Running in Codespaces — skipping shell change"
  fi
fi

# ----------------------------------------
# Completion message
# ----------------------------------------
echo "✅ Dotfiles install complete."
echo "💡 Tip: Run 'source ~/.zshrc' now to apply your changes immediately."
