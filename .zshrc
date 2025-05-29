# ----------------------------------------
# 🧠 Local environment overrides (per device)
# ----------------------------------------
[[ -f "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh" ]] && source "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh"

# ----------------------------------------
# 📁 Fallback: Set DOTFILES path if not set
# ----------------------------------------
if [[ -z "$DOTFILES" ]]; then
  export DOTFILES="${HOME}/dotfiles"
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
  cd ~/Workspace/Dev/Projects/mortworks/dotfiles
  echo "🛠  Mortworks mode activated."
  ls
}

# ----------------------------------------
# 👋 Friendly neutral startup message
# ----------------------------------------
echo "Welcome, mortworks 👋  Terminal is ready."
