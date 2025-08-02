# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for a Linux desktop environment using Sway (Wayland compositor) and Neovim. The setup includes:

- **Neovim configuration** based on LazyVim starter template
- **Sway window manager** configuration with Gruvbox theming
- **Waybar** status bar configuration
- **Development tools** for C#/Blazor development

## Architecture

### Neovim Configuration (`nvim/`)
- Built on LazyVim framework with lazy.nvim plugin manager
- Plugin configurations in `lua/plugins/` directory
- Core configuration in `lua/config/` (options, keymaps, autocmds)
- Custom plugins include:
  - `claude-code.lua`: Integration with Claude Code editor (extensive keybindings under `<leader>cc`)
  - `gruvbox.lua`: Gruvbox colorscheme with transparency enabled
  - `roslyn.lua`: Roslyn LSP for C# development (replaces OmniSharp)

### Sway Configuration (`sway/`)
- Main config uses Gruvbox color scheme
- Vim-style keybindings (hjkl for movement)
- Alt+Gr (Mod5) as secondary modifier
- Integrates with foot terminal and rofi launcher

### Waybar Configuration (`waybar/`)
- Bottom-positioned status bar
- Displays workspaces, window title, system load, battery, and dual clocks
- Gruvbox-themed styling

## Common Development Commands

### Neovim
- Configuration uses LazyVim defaults with lazy.nvim plugin manager
- Lua code formatting: `stylua .` (2-space indentation, 120 column width)
- Plugin management through lazy.nvim (auto-installs on startup)
- **Important**: `vim.g.autoformat = false` - formatting is disabled by default
- **Important**: Uses tabs instead of spaces (`vim.opt.expandtab = false`)

### C# Development
- Uses Roslyn LSP server (seblj/roslyn.nvim) instead of OmniSharp
- OmniSharp is explicitly disabled in configuration
- Mason registry includes custom registry for additional C# tools
- LazyVim extras enabled: `lang.omnisharp`, `lang.go`, `lang.json`

### System Configuration
- Sway config reloads with `$mod+Shift+c`
- Waybar restarts with systemctl or direct process management
- Sway uses Mod4 (Super) as primary modifier, Mod5 (Alt+Gr) as secondary
- Uses `foot` terminal and `rofi` application launcher

## File Structure
```
nvim/
├── lua/
│   ├── config/          # Core LazyVim configuration
│   └── plugins/         # Custom plugin configurations
├── init.lua             # Entry point
├── lazy-lock.json       # Plugin version lock file
└── stylua.toml         # Lua formatting configuration

sway/
├── config              # Main Sway configuration
├── config.d/           # Additional configuration snippets
└── environment         # Environment variables

waybar/
├── config.jsonc        # Waybar configuration
└── style.css          # Waybar styling
```

## Claude Code Integration

The Neovim configuration includes extensive Claude Code integration with keybindings:
- `<leader>cct`: Toggle Claude Code
- `<leader>ccf`: Focus Claude Code
- `<leader>ccr`: Resume Claude Code session
- `<leader>ccc`: Continue Claude Code session
- `<leader>ccb`: Add current buffer to Claude Code
- `<leader>ccs`: Send selection to Claude Code (visual mode)
- `<leader>cca`: Accept Claude Code diff
- `<leader>ccd`: Deny Claude Code diff

## Development Notes

- The Neovim setup follows LazyVim patterns for plugin configuration
- Sway configuration uses Gruvbox colors consistently across the desktop
- All configurations are version-controlled and designed for reproducible setup
- The setup includes development tools for C#/Blazor projects with full LSP support
- **Important**: Neovim is configured to use tabs, not spaces, and has autoformatting disabled by default