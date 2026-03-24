# LazyVim Core Plugins Reference

These plugins are included by default (no extras needed).

## Coding

### blink.cmp
Completion engine. Config via `opts`:
- `completion.menu` — appearance
- `completion.documentation` — docs panel
- `cmdline` — command-line completion
- `keymap` — completion keymaps

Follow main branch (requires Rust toolchain):
```lua
-- lua/config/options.lua
vim.g.lazyvim_blink_main = true
```

### mini.pairs
Auto-pairs `"`, `[`, `(`, etc. Skips inside strings and markdown code blocks.

### mini.ai
Expands text objects: arguments `a`, function calls, brackets, quotes, code blocks `b`, functions `f`, classes `c`, tags `t`.

### ts-comments.nvim
Multi-syntax comment support per language (e.g. different comment styles in JSX).

### lazydev.nvim
Configures LuaLS for Neovim config files. Provides auto-completion and type-checking for Neovim APIs.

---

## Editor

### grug-far.nvim
Multi-file search and replace. `<leader>sr`

### flash.nvim
Jump to any location with labels. `s` (jump), `S` (treesitter), `r` (remote flash in operator mode).

### which-key.nvim
Shows available keybindings in a popup. Helix preset. Keymap groups organized by prefix.

### gitsigns.nvim
Git diff highlights in the gutter. Stage/reset hunks, blame, inline preview.
- `<leader>gh*` — hunk operations
- `<leader>uG` — toggle globally
- `]h`/`[h` — navigate hunks

### trouble.nvim
Better diagnostics list, LSP references, symbols, location/quickfix lists.
- `<leader>x*` — open various lists
- `[q`/`]q` — navigate quickfix

### todo-comments.nvim
Highlights and lists TODO, HACK, BUG, NOTE comments. `<leader>xt`, `<leader>st`

---

## Formatting

### conform.nvim
Primary formatter. Triggered by `<leader>cf` or on save (when auto-format enabled).

Default formatters: stylua (Lua), fish_indent (Fish), shfmt (Shell).

**Do not override `config`** — use `opts` only.

Extend formatters:
```lua
{ "stevearc/conform.nvim", opts = {
  formatters_by_ft = { python = { "black" } },
  formatters = {
    my_formatter = { command = "my_cmd", args = { "--flag" } },
  },
}}
```

---

## Linting

### nvim-lint
Async linting via `vim.diagnostic`. Triggers on `BufWritePost`, `BufReadPost`, `InsertLeave`. Debounced 100ms.

Default: fish linter for Fish files.

```lua
{ "mfussenegger/nvim-lint", opts = {
  linters_by_ft = { python = { "flake8" } },
}}
```

---

## LSP

### nvim-lspconfig
Core LSP client. Configured via `opts.servers` (a map of server name → config).

Inlay hints enabled by default (toggle: `<leader>uh`). Code lens and folding supported.

### mason.nvim
Manages installation of LSP servers, formatters, linters, debuggers. Servers listed in `opts.servers` are auto-installed.

```lua
{ "mason-org/mason.nvim", opts = {
  ensure_installed = { "stylua", "shellcheck", "shfmt" },
}}
```

### Default LSP keymaps
| Key | Action |
|---|---|
| `gd` | Definition |
| `gr` | References |
| `gI` | Implementation |
| `gy` | Type definition |
| `K` | Hover |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename |

---

## TreeSitter

### nvim-treesitter
Syntax highlighting and parsing. Indent and fold enabled.

Default parsers: bash, c, diff, html, javascript, jsdoc, json, json5, lua, luadoc, markdown, markdown_inline, python, query, regex, toml, tsx, typescript, vim, vimdoc, xml, yaml.

### nvim-treesitter-textobjects
Movement: `]f`/`[f` (function), `]c`/`[c` (class), `]a`/`[a` (parameter). Uppercase = end positions.

### nvim-ts-autotag
Auto-closes and renames HTML/JSX tags.

---

## UI

### bufferline.nvim
Tab bar with filetype icons. `<S-h>`/`<S-l>` navigate buffers.

### lualine.nvim
Status line: git branch, diagnostics, filetype, progress, location.

### noice.nvim
Replaces cmdline, messages, and popupmenu UI. Includes command palette. Highly experimental.

### snacks.nvim
Multi-purpose plugin providing:
- **Dashboard** — LazyVim ASCII header with quick-access menu
- **Indent guides** — visible indentation
- **Smooth scroll** — animated scrolling
- **Notifications** — `<leader>sn` notification history
- **Terminal** — `<C-/>` floating terminal
- **Scratch buffers** — `<leader>\.`
- **Big file** — disables heavy features for large files
- **Input** — improved `vim.ui.input`
- **Profiler** — `<leader>pp`

### mini.icons
Icon provider (lazy-loaded). Drop-in replacement for nvim-web-devicons.

---

## Util

### persistence.nvim
Session management. Saves buffers and window layout on exit.
- `<leader>qs` — restore session for cwd
- `<leader>ql` — restore last session
- `<leader>qS` — select session

### plenary.nvim
Utility library used by many plugins. Lazy-loaded.
