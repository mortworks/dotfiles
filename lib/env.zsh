# lib/env.zsh

export EDITOR="${EDITOR:-nano}"

# Set PROJECTS path and TOOLS_DIR
if [[ "$CODESPACES" == "true" ]]; then
  export PROJECTS="/workspaces"
  export TOOLS_DIR="$PROJECTS/mortworks/workflow-tools"
elif [[ -d "$HOME/Workspace/Dev/Projects/mortworks/workflow-tools" ]]; then
  export PROJECTS="$HOME/Workspace/Dev/Projects/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
else
  export PROJECTS="$HOME/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
fi

# Add hugo-tools to PATH
if [[ -d "$TOOLS_DIR/hugo-tools/bin" ]]; then
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
fi
