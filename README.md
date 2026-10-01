# dotfiles

Managed with [`mise bootstrap`](https://mise.jdx.dev/bootstrap.html). One file,
[`mise/config.toml`](mise/config.toml), declares everything:

| Section | What it does |
|---|---|
| `[dotfiles]` | symlinks configs from this repo into place (herdr, fresh, mise itself) |
| `[bootstrap.packages]` | Homebrew formulae & casks (mise installs them directly) |
| `[tools]` | versioned tools (bun) |
| `[tasks.bootstrap]` | anything else, run at the end (installs critique) |

`mise/config.toml` is linked to `~/.config/mise/config.toml`, so it's also the
global mise config.

## Day to day

Edit configs as normal (they're symlinks into this repo), then commit & push.

```sh
mise bootstrap --dry-run      # what would change
mise bootstrap                # apply
mise bootstrap status         # what's installed / linked
```

Add a Homebrew package: add a `"brew:name"` or `"brew-cask:name"` line, then
`mise bootstrap`.

Track a new config file: add a line under `[dotfiles]`
(`"~/.config/thing/config" = "~/dotfiles/thing/config"`), move the file into
the repo, then `mise bootstrap`.

## New machine

```sh
curl -fsSL https://raw.githubusercontent.com/lukeAtTriver/dotfiles/main/install.sh | sh
```

Afterwards, make sure your shell has `/opt/homebrew/bin` on `PATH` and runs
`eval "$(mise activate zsh)"`.

Not automated: `okta` (its tap needs Ruby) — `brew install --cask oktadev/tap/okta`.

This repo is **public** — check for tokens/secrets before committing.
