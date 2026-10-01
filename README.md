# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
folder is a "package" whose contents mirror `$HOME`; stow symlinks them into
place, so editing a config anywhere edits it here.

| Package | Links to |
|---|---|
| `herdr` | `~/.config/herdr/config.toml`, `cheatsheet.txt` |
| `fresh` | `~/.config/fresh/` (whole folder) |

## Day to day

Edit configs as normal, then:

```sh
cd ~/dotfiles && git add -A && git commit -m "..." && git push
```

## New machine

```sh
brew install stow herdr fresh-editor
git clone https://github.com/lukeAtTriver/dotfiles ~/dotfiles
cd ~/dotfiles && stow herdr fresh
```

Critique (diff popups) installs with `bun install -g critique`.

## Adding something new

Move the file into a package that mirrors its path under `$HOME`, then stow it:

```sh
mkdir -p ~/dotfiles/zsh && mv ~/.zshrc ~/dotfiles/zsh/ && cd ~/dotfiles && stow zsh
```

This repo is **public** — check for tokens/secrets before committing.
