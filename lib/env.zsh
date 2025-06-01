# ----------------------------------------
# 🌍 Detect environment and set project paths
# ----------------------------------------

# Set EDITOR default if not already defined
export EDITOR="${EDITOR:-nano}"

# Set PROJECTS path dynamically based on environment
if [[ "$CODESPACES" == "true" ]]; then
  export PROJECTS="/workspaces"
  export TOOLS_DIR="/workspaces/mortworks/workflow-tools"
else
  export PROJECTS="$HOME/mortworks"
  export TOOLS_DIR="$HOME/mortworks/workflow-tools"
fi

# Add workflow-tools binaries to PATH (if present)
if [[ -d "$TOOLS_DIR/hugo-tools/bin" ]]; then
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
fi
