#!/usr/bin/env bash

# 📦 Ensure workflow-tools repo is available
# Sets $TOOLS_ROOT if found, or exits with error

set -e

KNOWN_PATHS=(
  "/workspaces/mortworks/workflow-tools"
  "$HOME/mortworks/workflow-tools"
  "$HOME/workflow-tools"
)

TOOLS_ROOT=""
for path in "${KNOWN_PATHS[@]}"; do
  if [[ -d "$path" ]]; then
    TOOLS_ROOT="$path"
    break
  fi
done

if [[ -z "$TOOLS_ROOT" ]]; then
  echo "❌ Could not locate workflow-tools repo in expected paths:"
  printf ' - %s\n' "${KNOWN_PATHS[@]}"
  echo "You may need to clone it:"
  echo "  git clone https://github.com/mortworks/workflow-tools.git ~/workflow-tools"
  exit 1
fi

export TOOLS_ROOT
