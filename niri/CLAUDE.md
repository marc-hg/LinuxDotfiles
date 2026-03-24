# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [niri](https://github.com/YaLTeR/niri) Wayland compositor configuration. Niri is a scrollable-tiling compositor. The entire config lives in a single file: `config.kdl`.

## Config Format

The file uses [KDL](https://kdl.dev) format. Key syntax notes:
- `/-` comments out the next node (not just a line)
- `r#"..."#` is a raw string (used for regex in window rules)
- `Mod` maps to Super when running on TTY, Alt when running as a winit window

## Applying Changes

Reload config without restarting: `niri msg action reload-config` (also bound to `Mod+Shift+R`)

To inspect current state: `niri msg outputs`, `niri msg windows`, `niri msg workspaces`

## Key Design Decisions

- **Keyboard layout**: `us altgr-intl` variant; CapsLock remapped to Escape; Left Alt and Left Win swapped (`altwin:swap_lalt_lwin`) — this makes the physical Win key act as Alt and vice versa, which affects how `Mod` (Super) binds work in practice
- **Workspaces**: 10 named, fixed workspaces (1–10) matching sway behavior; `Mod5+{-,=,0,8,9}` provides numpad-style access to workspaces 6–10
- **Floating**: `Mod+Shift+Space` toggles floating, `Mod+Space` switches focus between floating/tiling (matches sway semantics, not niri defaults)
- **Animations**: globally disabled (`off`)
- **Display**: DP-1 at 1920x1080@120Hz; eDP-1 config exists but is commented out

## Startup Programs

- `waybar` — status bar
- `swaybg` with `~/Pictures/universe.jpg` — wallpaper
- `wl-paste --watch cliphist` — clipboard history daemon

## Notable Binds

| Bind | Action |
|------|--------|
| `Mod+V` | Clipboard history picker (cliphist + rofi) |
| `Mod+Shift+S` | Region screenshot to clipboard (grim + slurp) |
| `Ctrl+Mod+Shift+S` | Region screenshot to `~/Pictures/Snippets/` |
| `Mod+Shift+M` | Toggle laptop screen (`toggle-laptop-screen` script) |
| `Super+Alt+L` | Lock screen (swaylock) |
| `Mod+D` | App launcher (rofi combi drun+run) |

## Window Rules

- **WezTerm**: empty `default-column-width` to work around initial configure bug
- **Firefox PiP**: opens floating
- **Brave Meet** (`title="^Meet -"`): opens floating
- **Zen Browser**: `draw-border-with-background false` to fix focus ring bleeding through transparency
