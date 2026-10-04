# Neovim config

Personal Neovim setup using [lazy.nvim](https://github.com/folke/lazy.nvim). Plugins install themselves on first launch.

## Install (CachyOS / Arch)

```sh
git clone https://github.com/NMMcDonald/Neovim-config.git ~/Neovim-config
~/Neovim-config/install.sh
```

The script installs the system packages below, symlinks the config to `~/.config/nvim` (backing up any existing one), and installs plugins at the versions pinned in `lazy-lock.json`.

Afterwards, set your terminal font to **JetBrainsMono Nerd Font** so icons render.

## What the config needs

| Package | Why |
| --- | --- |
| `neovim` (0.10+) | rustaceanvim v5 requires it |
| `git` | lazy.nvim clones plugins with it |
| `base-devel` | gcc and make, for telescope-fzf-native and treesitter parsers; g++ for the C++ workflow |
| `tree-sitter-cli` | nvim-treesitter compiles language parsers with it |
| `ripgrep`, `fd` | Telescope live grep and faster file finding |
| `wl-clipboard` / `xclip` | `y` yanks to the system clipboard (Wayland / X11) |
| `ttf-jetbrains-mono-nerd` | icons used by pomo.nvim |
| `rust-analyzer` | LSP for rustaceanvim |

## Keeping it in sync

- After adding or updating plugins: `:Lazy sync`, then commit `lazy-lock.json`.
- On another machine after pulling: `:Lazy restore`.

## Keymaps

Leader is `Space`.

| Keys | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `K` (Rust buffers) | Hover actions |
