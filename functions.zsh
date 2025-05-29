# Custom shell functions go here

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Add more utility functions over time

# Switch to mortworks workspace
mortworks() {
  cd ~/Workspace/Dev/Projects/mortworks/dotfiles
  echo "🛠  Mortworks mode activated."
  ls
}
