# codespaces.zsh — environment overrides for GitHub Codespaces

# 🌍 Set expected path to workflow-tools
export WORKFLOW_TOOLS="/workspaces/mortworks/workflow-tools"

# ➕ Add all bin directories under workflow-tools to PATH
if [[ -d "$WORKFLOW_TOOLS" ]]; then
  for BIN in "$WORKFLOW_TOOLS"/*/bin; do
    [[ -d "$BIN" ]] && export PATH="$BIN:$PATH"
  done
fi

# 📦 Ensure yq is installed in Codespaces (user-level)
if ! command -v yq >/dev/null 2>&1; then
  echo "🔧 Installing yq for YAML processing (user space)..."
  mkdir -p ~/.local/bin
  wget -qO ~/.local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
  chmod +x ~/.local/bin/yq
  export PATH="$HOME/.local/bin:$PATH"
fi
