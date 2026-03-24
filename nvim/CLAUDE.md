# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [LazyVim](https://lazyvim.github.io)-based Neovim configuration. It uses LazyVim's opinionated defaults with local overrides. Most functionality is inherited from LazyVim — prefer extending over reimplementing.

## Lua Formatting

All Lua files must be formatted with **stylua** before committing:

```sh
stylua lua/
```

Config: 2-space indent, 120-character column width (see `stylua.toml`).

## Architecture

**Entry point:** `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim and loads all specs)

**Extension files** (all currently minimal — add customizations here):
- `lua/config/options.lua` — vim options
- `lua/config/keymaps.lua` — keybindings (loaded on `VeryLazy` event)
- `lua/config/autocmds.lua` — autocommands (loaded on `VeryLazy` event)
- `lua/plugins/` — plugin specs (any `.lua` file here is auto-imported)

**LazyVim extras** are managed in `lazyvim.json` (currently none enabled). Add extras via `:LazyExtras` UI rather than editing by hand.

**Plugin lock file:** `lazy-lock.json` — commit this to pin plugin versions.

## Adding / Modifying Plugins

Place plugin specs in `lua/plugins/`. Each file returns a table of lazy.nvim specs.

Three override patterns (all shown in the disabled `lua/plugins/example.lua`):

```lua
-- 1. Simple opts merge
{ "author/plugin", opts = { key = value } }

-- 2. Extend existing opts functionally
{ "author/plugin", opts = function(_, opts)
  table.insert(opts.list, "new_entry")
end }

-- 3. Disable a LazyVim-included plugin
{ "author/plugin", enabled = false }
```

## LSP Servers

Add servers via nvim-lspconfig opts (Mason will auto-install them):

```lua
{ "neovim/nvim-lspconfig", opts = { servers = { pyright = {} } } }
```

## Removing LazyVim Autocmds

LazyVim autocmd groups are prefixed `lazyvim_`. Delete them in `autocmds.lua`:

```lua
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
```

## Reference Docs

Detailed LazyVim documentation is in `.docs/`:

- `.docs/configuration.md` — all config patterns (options, keymaps, autocmds, plugins, LSP, formatting, linting)
- `.docs/keymaps.md` — complete default keymap reference
- `.docs/plugins-core.md` — core plugin reference (coding, editor, LSP, UI, etc.)
- `.docs/extras.md` — full extras catalog with descriptions
- `.docs/lang-extras.md` — per-language LSP/formatter/linter setup
- `.docs/recipes.md` — copy-paste examples for common customizations
