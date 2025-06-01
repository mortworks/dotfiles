# ----------------------------------------
# 🌍 Detect environment and set project paths
# ----------------------------------------

export EDITOR="${EDITOR:-nano}"

if [[ "$CODESPACES" == "true" ]]; then
  export PROJECTS="/workspaces"
  export TOOLS_DIR="/workspaces/mortworks/workflow-tools"
elif [[ -d "$HOME/Workspace/Dev/Projects/mortworks/workflow-tools" ]]; then
  export PROJECTS="$HOME/Workspace/Dev/Projects/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
else
  export PROJECTS="$HOME/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
fi

if [[ -d "$TOOLS_DIR/hugo-tools/bin" ]]; then
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
fi
