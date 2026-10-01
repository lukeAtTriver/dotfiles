#!/bin/sh
# New machine:  curl -fsSL https://raw.githubusercontent.com/lukeAtTriver/dotfiles/main/install.sh | sh
set -eu

# 1. mise
if ! command -v mise >/dev/null 2>&1; then
  curl -fsSL https://mise.run | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

# 2. this repo
[ -d "$HOME/dotfiles" ] || git clone https://github.com/lukeAtTriver/dotfiles "$HOME/dotfiles"

# 3. packages, dotfiles, tools — all from mise/config.toml
#    (points mise at the repo copy until bootstrap links it into ~/.config/mise)
mise trust "$HOME/dotfiles/mise/config.toml"
MISE_GLOBAL_CONFIG_FILE="$HOME/dotfiles/mise/config.toml" mise bootstrap "$@"
