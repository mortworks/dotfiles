# ----------------------------------------
# 🌍 Environment-specific DOTFILES path
# ----------------------------------------

case "$(uname -s)" in
  Darwin)
    # macOS
    export DOTFILES="$HOME/Workspace/Dev/Projects/mortworks/dotfiles"
    ;;

  Linux)
    if [ -n "$CODESPACES" ] || grep -q "codespace" <<< "$HOSTNAME"; then
      # GitHub Codespaces
      export DOTFILES="$HOME/dotfiles"
    else
      # Generic Linux fallback
      export DOTFILES="$HOME/.dotfiles"
    fi
    ;;
esac
