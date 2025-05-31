require_tool() {
  local relative_path="$1"
  local full_path="$TOOLS_ROOT/$relative_path"

  if [[ ! -f "$full_path" ]]; then
    echo "❌ Required tool not found: $full_path"
    return 1
  fi

  echo "$full_path"
}
