# ----------------------------------------
# 🛠 General environment variables
# ----------------------------------------

# Preferred text editor
export EDITOR="nano"  # You can change to 'vim' or 'nvim' later

# Dynamically set project root path
if [[ "$CODESPACES" == "true" ]]; then
  export PROJECTS="/workspaces"
else
  export PROJECTS="$HOME/mortworks"
fi


# ----------------------------------------
# 🧰 Add workflow-tools scripts to PATH (if present)
# ----------------------------------------

TOOLS_DIR="$PROJECTS/workflow-tools"
if [[ -d "$TOOLS_DIR/hugo-tools/bin" ]]; then
  export PATH="$TOOLS_DIR/hugo-tools/bin:$PATH"
fi
