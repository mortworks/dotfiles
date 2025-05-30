# ----------------------------------------
# 🧠 Local environment overrides (per device)
# ----------------------------------------
[[ -f "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh" ]] && source "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh"
[[ -f "${HOME}/dotfiles/local/codespaces.zsh" ]] && source "${HOME}/dotfiles/local/codespaces.zsh"

# ----------------------------------------
# 📁 Fallback: Set DOTFILES path if not already set
# ----------------------------------------
if [[ -z "$DOTFILES" ]]; then
  if [[ -d "${HOME}/dotfiles" ]]; then
    export DOTFILES="${HOME}/dotfiles"
  elif [[ -d "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles" ]]; then
    export DOTFILES="${HOME}/Workspace/Dev/Projects/mortworks/dotfiles"
  fi
fi

# ----------------------------------------
# 🛠 Add custom scripts to PATH
# ----------------------------------------
export PATH="${DOTFILES}/bin:$PATH"

# ----------------------------------------
# ⚙️ Load modular shell config files
# ----------------------------------------
[[ -f "${DOTFILES}/aliases.zsh" ]]   && source "${DOTFILES}/aliases.zsh"
[[ -f "${DOTFILES}/functions.zsh" ]] && source "${DOTFILES}/functions.zsh"
[[ -f "${DOTFILES}/exports.zsh" ]]   && source "${DOTFILES}/exports.zsh"

# ----------------------------------------
# 🚀 Mortworks shortcut command
# ----------------------------------------
mw() {
  cd "$DOTFILES"
  echo "🛠  Mortworks mode activated."
  ls
}

# ----------------------------------------
# 👋 Friendly neutral startup message
# ----------------------------------------
echo "Welcome, mortworks 👋  Terminal is ready."
