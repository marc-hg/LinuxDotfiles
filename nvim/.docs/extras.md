# LazyVim Extras

Enable extras via `:LazyExtras` — this writes to `lazyvim.json` automatically. Do not edit that file by hand.

## AI

| Extra | Description |
|---|---|
| `ai.avante` | avante.nvim — AI code assistant (default: Copilot). `<leader>aa/ac/ae` |
| `ai.codeium` | codeium.nvim — AI completions. `<M-]>`/`<M-[>` cycle suggestions |
| `ai.copilot` | GitHub Copilot inline completions |
| `ai.copilot-chat` | CopilotChat.nvim — chat interface |
| `ai.supermaven` | Supermaven completions |
| `ai.tabnine` | Tabnine completions |

## Coding

| Extra | Description |
|---|---|
| `coding.blink` | blink.cmp — completion engine (already default in v15) |
| `coding.luasnip` | LuaSnip — snippet engine alternative |
| `coding.mini-surround` | mini.surround — `gsa/gsd/gsr/gsf/gsF/gsh/gsn` |
| `coding.neogen` | Annotation generator. `:Neogen`, `<leader>cn` |
| `coding.yanky` | Yanky — yank history, `[y`/`]y` cycle, `<leader>p` picker |

## DAP (Debugging)

| Extra | Description |
|---|---|
| `dap.core` | nvim-dap + nvim-dap-ui + virtual text. `<leader>d*` keymaps |

Language adapters must be added separately (see lang extras).

## Editor

| Extra | Description |
|---|---|
| `editor.aerial` | Aerial — symbol tree sidebar. `<leader>cs` |
| `editor.fzf` | fzf-lua picker. Set `vim.g.lazyvim_picker = "fzf"` |
| `editor.telescope` | Telescope picker. Set `vim.g.lazyvim_picker = "telescope"` |
| `editor.outline` | outline.nvim — symbol tree. `<leader>cs` |
| `editor.leap` | leap.nvim — motion plugin |
| `editor.inc-rename` | Incremental rename preview. `<leader>cr` |
| `editor.harpoon2` | Harpoon — file marks |
| `editor.mini-diff` | mini.diff — inline diff view |
| `editor.mini-files` | mini.files — file browser. `<leader>fm` |
| `editor.neo-tree` | neo-tree.nvim — file tree sidebar. `<leader>fe/fE` |
| `editor.overseer` | Overseer — task runner |
| `editor.refactoring` | Refactoring operations |

## Formatting

| Extra | Description |
|---|---|
| `formatting.black` | Black — Python formatter |
| `formatting.prettier` | Prettier — JS/TS/CSS/HTML formatter |
| `formatting.biome` | Biome — JS/TS formatter/linter |

Prettier config: `vim.g.lazyvim_prettier_needs_config = false`

## Language

See [lang-extras.md](lang-extras.md) for full language reference.

| Extra | Languages |
|---|---|
| `lang.angular` | Angular (requires lang.typescript) |
| `lang.clangd` | C / C++ |
| `lang.docker` | Dockerfile, Docker Compose |
| `lang.elixir` | Elixir |
| `lang.elm` | Elm |
| `lang.go` | Go |
| `lang.haskell` | Haskell |
| `lang.java` | Java (jdtls) |
| `lang.json` | JSON + SchemaStore |
| `lang.kotlin` | Kotlin |
| `lang.markdown` | Markdown (preview + render) |
| `lang.nix` | Nix |
| `lang.omnisharp` | C# (OmniSharp) |
| `lang.php` | PHP |
| `lang.prisma` | Prisma |
| `lang.python` | Python (pyright/basedpyright + ruff) |
| `lang.ruby` | Ruby |
| `lang.rust` | Rust (rustaceanvim) |
| `lang.scala` | Scala (nvim-metals) |
| `lang.sql` | SQL (dadbod) |
| `lang.svelte` | Svelte |
| `lang.tailwind` | Tailwind CSS |
| `lang.terraform` | Terraform |
| `lang.toml` | TOML |
| `lang.typescript` | TypeScript / JavaScript |
| `lang.vue` | Vue |
| `lang.yaml` | YAML + SchemaStore |

## Linting

| Extra | Description |
|---|---|
| `linting.eslint` | ESLint LSP. `vim.g.lazyvim_eslint_auto_format = true` |
| `linting.biomejs` | Biome linting |

## LSP

| Extra | Description |
|---|---|
| `lsp.neoconf` | neoconf.nvim — per-project LSP settings via `.neoconf.json`. `:Neoconf` |
| `lsp.none-ls` | none-ls (null-ls) — additional sources for formatting/diagnostics |

## Test

| Extra | Description |
|---|---|
| `test.core` | neotest — testing framework. `<leader>t*` keymaps. Requires language adapters |

Add adapters:
```lua
-- lua/plugins/test.lua
return {
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest", opts = { adapters = { "neotest-plenary" } } },
}
```

## UI

| Extra | Description |
|---|---|
| `ui.alpha` | alpha-nvim — alternative dashboard |
| `ui.edgy` | edgy.nvim — predefined window layouts. `<leader>ue/uE` |
| `ui.mini-animate` | mini.animate — scroll/cursor animations. `<leader>ua` |
| `ui.mini-indentscope` | mini.indentscope — animated indent guides |
| `ui.noice` | noice.nvim (already default) |
| `ui.treesitter-context` | treesitter-context — sticky context header |

### edgy.nvim layout (when enabled)
- **Bottom:** Terminal, Noice, Trouble, QuickFix, Help, Spectre, Neotest output
- **Left:** Neotest summary
- **Right:** Grug Far

**Note:** If using aerial or outline, import edgy _before_ them.

## Utilities

| Extra | Description |
|---|---|
| `util.chezmoi` | Chezmoi dotfile manager integration. `<leader>sz` |
| `util.dot` | Dotfile support: bashls, shellcheck, treesitter for rasi/kitty/hypr/fish/etc. |
| `util.gitui` | GitUI TUI alternative to lazygit |
| `util.mini-hipatterns` | Highlight hex colors and Tailwind class colors |
| `util.octo` | Octo — GitHub issues/PRs in Neovim |
| `util.rest` | REST client (rest.nvim) |
| `util.startuptime` | Startup time profiler |
| `util.wakatime` | WakaTime coding stats |

## VS Code

`vscode` — Enables a subset of plugins when running inside VS Code with `vscode-neovim`. Only activates when `vim.g.vscode` is set.
