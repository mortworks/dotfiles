# 1. Source local overrides first (you've renamed mac.zsh → local.zsh)
[[ -f "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh" ]] && source "${HOME}/Workspace/Dev/Projects/mortworks/dotfiles/local/local.zsh"

# 2. Fallback if DOTFILES isn't already set
if [[ -z "$DOTFILES" ]]; then
  export DOTFILES="${HOME}/dotfiles"
fi

# 3. Source the main config files
[[ -f "${DOTFILES}/aliases.zsh" ]]   && source "${DOTFILES}/aliases.zsh"
[[ -f "${DOTFILES}/functions.zsh" ]] && source "${DOTFILES}/functions.zsh"
[[ -f "${DOTFILES}/exports.zsh" ]]   && source "${DOTFILES}/exports.zsh"

echo "Welcome, mortworks 👋  Ready to work."

