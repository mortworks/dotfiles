# lib/env.zsh

# ----------------------------------------
# 🌍 Environment and tooling setup
# ----------------------------------------

# Default editor fallback
export EDITOR="${EDITOR:-nano}"

# Dynamically resolve PROJECTS and TOOLS_DIR
if [[ "$CODESPACES" == "true" ]]; then
  # In GitHub Codespaces
  export PROJECTS="/workspaces"
  if [[ -d "$PROJECTS/mortworks/workflow-tools/hugo-tools/bin" ]]; then
    export TOOLS_DIR="$PROJECTS/mortworks/workflow-tools"
    export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
  fi
elif [[ -d "$HOME/Workspace/Dev/Projects/mortworks/workflow-tools/hugo-tools/bin" ]]; then
  # Local dev environment (Mac, etc.)
  export PROJECTS="$HOME/Workspace/Dev/Projects/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
elif [[ -d "$HOME/mortworks/workflow-tools/hugo-tools/bin" ]]; then
  # Fallback for simpler setups
  export PROJECTS="$HOME/mortworks"
  export TOOLS_DIR="$PROJECTS/workflow-tools"
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
else
  echo "⚠️  workflow-tools not found — hugo-tools binaries not added to PATH"
fi
