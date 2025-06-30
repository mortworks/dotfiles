# codespaces.zsh — environment overrides for GitHub Codespaces

export WORKFLOW_TOOLS="/workspaces/mortworks/workflow-tools"

# 📦 Ensure yq is installed in Codespaces (user-level)
if ! command -v yq >/dev/null 2>&1; then
  echo "🔧 Installing yq for YAML processing (user space)..."
  mkdir -p ~/.local/bin
  wget -qO ~/.local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
  chmod +x ~/.local/bin/yq
  export PATH="$HOME/.local/bin:$PATH"
fi

