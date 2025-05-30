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
# 🐚 Fix $SHELL if it's incorrect (e.g. Codespaces)
# ----------------------------------------
if [[ -n "$ZSH_VERSION" && "$SHELL" != "$(command -v zsh)" ]]; then
  export SHELL="$(command -v zsh)"
fi

# ----------------------------------------
# 🧠 Local environment overrides (per device)
# ----------------------------------------
[[ -f "${DOTFILES}/local/local.zsh" ]] && source "${DOTFILES}/local/local.zsh"
[[ -f "${DOTFILES}/local/codespaces.zsh" ]] && source "${DOTFILES}/local/codespaces.zsh"

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
# 🗂 Automatically cd to Codespaces workspace roo
# ----------------------------------------t
if [[ -n "$CODESPACES" ]]; then
  # Default to /workspaces/<repo-name> if available
  if [[ -d "/workspaces" && -n "$GITHUB_REPOSITORY" ]]; then
    cd "/workspaces/$(basename "$GITHUB_REPOSITORY")"
  elif [[ -d "$PWD" ]]; then
    cd "$PWD"
  fi
fi


# ----------------------------------------
# 👋 Friendly neutral startup message
# ----------------------------------------
echo "Welcome, mortworks 👋  Terminal is ready."


