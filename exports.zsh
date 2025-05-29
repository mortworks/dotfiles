# Environment variables

export EDITOR="nano"  # Change to 'nvim' or 'vim' later

# Dynamically set the PROJECTS path based on environment
if [[ "$CODESPACES" == "true" ]]; then
  # In GitHub Codespaces
  export PROJECTS="/workspaces"
else
  # Local (Mac, etc.)
  export PROJECTS="$HOME/mortworks"
fi

