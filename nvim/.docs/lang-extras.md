# Language Extras Reference

Enable with `:LazyExtras`. Each extra installs treesitter parsers, LSP servers (via Mason), formatters, and linters for the language.

## TypeScript / JavaScript

Extra: `lang.typescript`

Configure LSP in `lua/config/options.lua`:
```lua
vim.g.lazyvim_ts_lsp = "vtsls"  -- default, or "tsgo"
```

- **vtsls** — TypeScript LSP with organize imports, rename file
- **mason.nvim** — js-debug-adapter
- **nvim-dap** (optional) — Node, Chrome, Edge debug adapters
- Sub-extras: `lang.typescript.biome`, `lang.typescript.oxc`, `lang.typescript.vtsls`

## Python

Extra: `lang.python`

Configure in `lua/config/options.lua`:
```lua
-- LSP: "pyright" (default) or "basedpyright"
-- Formatter: "ruff" (default) or "ruff_lsp"
```

- **pyright / basedpyright** + **ruff** LSP
- **neotest-python** — test runner
- **nvim-dap-python** — debug with test keymaps
- **venv-selector.nvim** — `<leader>cv` select virtualenv

## Go

Extra: `lang.go`

- **Tree-sitter**: go, gomod, gowork, gosum
- **gopls** — LSP with code lenses (GC details, test execution)
- **mason** — goimports, gofumpt, gomodifytags, impl, golangci-lint, delve
- **neotest-golang** (optional)
- **nvim-dap + nvim-dap-go** (optional)

## Rust

Extra: `lang.rust`

Configure in `lua/config/options.lua`:
```lua
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
-- or "bacon-ls" (bacon-ls handles diagnostics only)
```

- **rustaceanvim** — main LSP: code actions `<leader>cR`, debuggables `<leader>dr`, DAP via codelldb
- **crates.nvim** — Cargo.toml LSP (completion, actions, hover)
- **mason** (optional) — codelldb, bacon
- **neotest** (optional) — test running via rustaceanvim

## Java

Extra: `lang.java`

- **nvim-jdtls** — Root detection, workspace management, Lombok, DAP, test runner
- **mason** — java-debug-adapter, java-test
- Keymaps: `<leader>cx` (extract variable/method), `<leader>co` (organize imports)
- **nvim-dap** (optional) — remote attach on localhost:5005

## C / C++

Extra: `lang.clangd`

- **clangd_extensions.nvim** — Inlay hints, AST visualization
- **clangd** config: `<leader>ch` (switch source/header), background indexing, clang-tidy
- **nvim-dap** (optional) — codelldb (launch + attach)
- **mason** (optional) — codelldb

Fix offset encoding if needed:
```lua
-- lua/config/options.lua (or a plugin spec)
{ "neovim/nvim-lspconfig", opts = {
  servers = { clangd = { capabilities = { offsetEncoding = { "utf-16" } } } },
}}
```

## Scala

Extra: `lang.scala`

- **nvim-metals** — LSP: compiler output, type inference, implicit args, Test Explorer, DAP
- Keymaps: `<leader>me` (Metals commands), `<leader>mc` (compile cascade), `<leader>mh` (hover worksheet)
- **nvim-dap** (optional) — "RunOrTest" and "Test Target" launchers

## Ruby

Extra: `lang.ruby`

Configure in `lua/config/options.lua`:
```lua
vim.g.lazyvim_ruby_lsp = "ruby_lsp"         -- or "solargraph"
vim.g.lazyvim_ruby_formatter = "rubocop"     -- or "standardrb"
```

- **mason** — erb-formatter, erb-lint
- **nvim-dap-ruby**, **neotest-rspec** (optional)

## PHP

Extra: `lang.php`

Configure in `lua/config/options.lua`:
```lua
vim.g.lazyvim_php_lsp = "intelephense"  -- or "phpactor"
```

- **mason** — phpcs, php-cs-fixer
- **neotest-pest**, **neotest-phpunit** (optional)
- **nvim-dap** — php-debug-adapter (optional)

## Markdown

Extra: `lang.markdown`

- **marksman** LSP
- **mason** — markdownlint-cli2, markdown-toc
- **markdown-preview.nvim** — `<leader>cp` (browser preview)
- **render-markdown.nvim** — in-editor rendering, `<leader>um` toggle
- **conform.nvim** (optional) — prettier + markdownlint-cli2 + markdown-toc

## JSON

Extra: `lang.json`

- **jsonls** LSP
- **SchemaStore.nvim** — auto-loads schemas for known JSON files (package.json, tsconfig, etc.)
- json5 treesitter parser

## YAML

Extra: `lang.yaml`

- **yamlls** LSP with line folding
- **SchemaStore.nvim** — dynamic YAML schemas, Redhat telemetry disabled

## SQL

Extra: `lang.sql`

Configure connections in `lua/config/options.lua`:
```lua
vim.g.dbs = {
  { name = "dev", url = "postgres://..." },
}
```

- **vim-dadbod** — `:DB` command
- **vim-dadbod-ui** — `<leader>D` UI panel
- **vim-dadbod-completion** — DB-aware completion
- **sqlfluff** via mason
- **edgy.nvim** (optional) — panel layout

## Angular

Extra: `lang.angular` (requires `lang.typescript`)

- **angularls** LSP (rename provider disabled to prevent duplicates)
- **vtsls** extended with `@angular/language-server`
- Treesitter: angular, scss parsers
- **conform.nvim** — htmlangular formatted with prettier

## Tailwind CSS

Extra: `lang.tailwind`

- **tailwindcss** LSP — configurable excluded filetypes (markdown excluded by default)
- Phoenix template support (Elixir, Eelixir, Heex filetypes)
- **tailwindcss-colorizer-cmp.nvim** — color swatches in completion

## Docker

Extra: `lang.docker`

- **dockerls** + **docker_compose_language_service**
- **hadolint** linter (mason + nvim-lint)

## Nix

Extra: `lang.nix`

- **nil_ls** LSP
- **nixfmt** formatter (optional)
- **statix** linter (optional)

## Dotfiles (shell/config)

Extra: `util.dot`

- **bashls** LSP
- **shellcheck** (mason)
- Treesitter parsers: rasi/rofi/wofi, waybar, mako, kitty, hyprland, fish, git config
