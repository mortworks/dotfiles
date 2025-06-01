# ----------------------------------------
# 🌍 Environment variables
# ----------------------------------------

export EDITOR="nano"  # Change to 'nvim' or 'vim' later

# ----------------------------------------
# 📦 Load environment detection and tool path logic
# ----------------------------------------
[[ -f "$DOTFILES/lib/env.zsh" ]] && source "$DOTFILES/lib/env.zsh"
