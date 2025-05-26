# mortworks dotfiles

These are my personal shell configuration files, built from scratch to create a clean, efficient, and portable command-line environment.

## Philosophy

- Minimal to start, expandable by need
- All changes are intentional and documented
- Reinventing to understand, not to impress

## Components

- `.zshrc` — shell config
- `aliases.zsh` — shortcuts
- `functions.zsh` — reusable helpers
- `exports.zsh` — environment variables
- `install.sh` — optional bootstrap setup

## Setup

```bash
git clone https://github.com/mortworks/dotfiles.git ~/mortworks/dotfiles
cd ~/mortworks/dotfiles
./install.sh
