# LazyVim Recipes & Examples

Common patterns for customizing this config.

## Colorscheme

```lua
-- lua/plugins/colorscheme.lua
return {
  { "ellisonleao/gruvbox.nvim", opts = {} },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
}
```

## Add a blink.cmp / nvim-cmp Source

```lua
-- lua/plugins/completion.lua
return {
  { "hrsh7th/cmp-emoji" },
  { "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources.default, "emoji")
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.emoji = { module = "blink.compat.source", name = "emoji" }
    end,
  },
}
```

## Supertab (Tab for Completion + Snippets)

```lua
return {
  { "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
    },
  },
}
```

## Change mini.surround Keymaps

```lua
return {
  { "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",
      },
    },
  },
}
```

## Transparent TokyoNight

```lua
return {
  { "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
```

## Fix clangd Offset Encoding

```lua
return {
  { "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          capabilities = { offsetEncoding = { "utf-16" } },
        },
      },
    },
  },
}
```

## ESLint Auto-format on Save

```lua
-- lua/config/options.lua
vim.g.lazyvim_eslint_auto_format = true
```
Then enable the extra: `:LazyExtras` → `linting.eslint`

## Prettier (require config file)

```lua
-- lua/config/options.lua
vim.g.lazyvim_prettier_needs_config = true
```
Then enable: `:LazyExtras` → `formatting.prettier`

## Add Mason Tools (auto-install)

```lua
return {
  { "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "black",
      },
    },
  },
}
```

## Disable a Default Plugin

```lua
return {
  { "folke/noice.nvim", enabled = false },
}
```

## Remove a Default Keymap

```lua
-- lua/config/keymaps.lua
vim.keymap.del("n", "<leader>gg")  -- remove lazygit keymap
```

## Remove a Default Autocmd

```lua
-- lua/config/autocmds.lua
-- LazyVim autocmd groups are prefixed with "lazyvim_"
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
```

## Custom LSP On-attach Keymap

```lua
return {
  { "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          keys = {
            { "<leader>co", "<cmd>VtsExecOrganizeImports<cr>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>VtsExecRenameFile<cr>", desc = "Rename File" },
          },
        },
      },
    },
  },
}
```

## Extend Treesitter Parsers

```lua
return {
  { "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Use vim.list_extend, NOT vim.tbl_deep_extend for lists
      vim.list_extend(opts.ensure_installed, { "kotlin", "sql", "proto", "bash" })
    end,
  },
}
```

## lualine Customization (add component)

```lua
return {
  { "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
      -- or a real component:
      table.insert(opts.sections.lualine_x, {
        function() return require("noice").api.status.command.get() end,
        cond = function() return require("noice").api.status.command.has() end,
      })
    end,
  },
}
```

## Neotest Adapter Setup

```lua
-- lua/plugins/test.lua
return {
  { "nvim-neotest/neotest-python" },    -- install adapter
  { "nvim-neotest/neotest",
    opts = { adapters = { "neotest-python" } },
  },
}
```

## Per-project LSP Settings (neoconf)

Enable extra: `:LazyExtras` → `lsp.neoconf`

Create `.neoconf.json` in project root:
```json
{
  "lspconfig": {
    "pyright": {
      "pythonPath": ".venv/bin/python"
    }
  }
}
```

## snacks.nvim Dashboard Customization

```lua
return {
  { "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
```

## Picker Selection (fzf vs telescope)

```lua
-- lua/config/options.lua
vim.g.lazyvim_picker = "fzf"        -- enable extras/editor/fzf
-- or
vim.g.lazyvim_picker = "telescope"  -- enable extras/editor/telescope
```
