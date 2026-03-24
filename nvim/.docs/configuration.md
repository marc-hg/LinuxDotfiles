# LazyVim Configuration

## Requirements

- Neovim >= 0.11.2
- Git >= 2.19.0
- Optional: Nerd Font, lazygit, tree-sitter-cli, curl, fzf, ripgrep, fd

## File Structure

```
~/.config/nvim/
├── lua/
│   ├── config/
│   │   ├── autocmds.lua   # Custom autocommands (VeryLazy event)
│   │   ├── keymaps.lua    # Custom keybindings (VeryLazy event)
│   │   ├── lazy.lua       # Plugin manager bootstrap
│   │   └── options.lua    # Vim options + lazyvim_* globals
│   └── plugins/           # Plugin specs (auto-imported, any .lua file)
├── lazyvim.json            # Enabled extras (edit via :LazyExtras)
└── lazy-lock.json          # Pinned plugin versions (commit this)
```

**Warning:** Do not manually `require` files from `lua/config/` or `lazyvim.config`.

## Default Options

- Auto-write on focus loss; confirm before quitting modified buffers
- System clipboard sync (disabled over SSH)
- Line wrap disabled; relative line numbers; cursorline
- 2-space indent; smart case search; 200ms updatetime; 10,000 undolevels
- True color; visible whitespace

## Adding Vim Options

```lua
-- lua/config/options.lua
vim.opt.relativenumber = false
vim.g.some_plugin_option = true
```

## Plugin Spec Patterns

### Add a new plugin
```lua
-- lua/plugins/myplugin.lua
return {
  { "author/plugin-name", opts = { key = "value" } },
}
```

### Extend existing LazyVim plugin opts (merge)
```lua
return {
  { "author/plugin-name",
    opts = function(_, opts)
      opts.some_list = opts.some_list or {}
      table.insert(opts.some_list, "new_entry")
    end,
  },
}
```

### Disable a plugin
```lua
return {
  { "author/plugin-name", enabled = false },
}
```

### Merging rules
| Property | Behavior |
|---|---|
| `cmd`, `event`, `ft`, `keys`, `dependencies` | Extended (merged with defaults) |
| `opts` | Deep merged |
| Everything else | Overrides default |

## Plugin Keymaps

```lua
-- Add a keymap via plugin spec
{ "author/plugin", keys = { { "<leader>xx", "<cmd>Cmd<cr>", desc = "Do thing" } } }

-- Disable a default keymap (mode must match exactly)
{ "author/plugin", keys = { { "<leader>xx", false } } }
```

## Global Keymaps

```lua
-- lua/config/keymaps.lua
vim.keymap.set("n", "<leader>xx", "<cmd>Cmd<cr>", { desc = "Do thing" })

-- Remove a LazyVim default keymap
vim.keymap.del("n", "<leader>xx")
```

## Autocommands

```lua
-- lua/config/autocmds.lua

-- Add a new autocmd
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function() end,
})

-- Remove a LazyVim autocmd group (all prefixed with "lazyvim_")
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
```

## Colorscheme

```lua
-- lua/plugins/colorscheme.lua
return {
  { "ellisonleao/gruvbox.nvim" },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
}
```

## LSP Servers

```lua
-- lua/plugins/lsp.lua
return {
  { "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        yamlls = { settings = { yaml = { schemas = {} } } },
      },
    },
  },
}
```

Mason auto-installs configured servers. See [lang-extras.md](lang-extras.md) for language-specific LSP setup.

## LSP Keymaps

```lua
-- Global (all servers)
{ "neovim/nvim-lspconfig", opts = {
  servers = { ["*"] = { keys = {
    { "K", vim.lsp.buf.hover, desc = "Hover" },
  }}},
}}

-- Server-specific
{ "neovim/nvim-lspconfig", opts = {
  servers = { vtsls = { keys = {
    { "<leader>co", "<cmd>VtsExecOrganizeImports<cr>", desc = "Organize Imports" },
  }}},
}}

-- Capability-gated (has = "textDocument/<capability>")
{ keys = { { "gd", vim.lsp.buf.definition, has = "definition" } } }
```

## Formatting

```lua
-- lua/plugins/formatting.lua
return {
  { "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
      },
      formatters = {
        prettier = { prepend_args = { "--prose-wrap", "always" } },
      },
    },
  },
}
```

**Warning:** Do not override `plugin.config` on conform.nvim — this breaks LazyVim formatting.

## Linting

```lua
return {
  { "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
        markdown = { "markdownlint" },
      },
      linters = {
        -- Override linter options
        selene = { condition = function(ctx)
          return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        end },
      },
    },
  },
}
```

## Treesitter Parsers

```lua
return {
  { "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Use vim.list_extend (not vim.tbl_deep_extend) for lists
      vim.list_extend(opts.ensure_installed, { "kotlin", "sql", "proto" })
    end,
  },
}
```

## Extras System

Enable extras via `:LazyExtras` UI — this writes to `lazyvim.json`. Do not edit `lazyvim.json` by hand.

Available extra categories: ai, coding, dap, editor, formatting, lang, linting, lsp, test, ui, util, vscode.

See [extras.md](extras.md) for the full extras reference.
