# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a komorebi configuration directory containing JSON configuration files for the komorebi tiling window manager on Windows. The repository includes:

- Main komorebi configuration (`komorebi.json`)
- Status bar configuration (`komorebi.bar.json`)
- Application-specific window management rules (`applications.json`)

## Configuration Architecture

### Main Configuration (`komorebi.json`)
- Schema: `https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.37/schema.json`
- Contains core window manager settings including:
  - Window behaviors (hiding, cross-monitor movement)
  - Padding and border configurations
  - Theme settings (GruvboxDarkHard with Base16 palette)
  - Workspace definitions (5 workspaces with BSP layout)
  - Stackbar configuration for window grouping

### Status Bar Configuration (`komorebi.bar.json`)
- Schema: `https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.37/schema.bar.json`
- Configures the komorebi status bar with:
  - Font: ComicCodeLigatures Nerd Font
  - Theme matching main configuration
  - Left widgets: workspace, layout, and focused window information
  - Right widgets: system monitoring (updates, media, storage, memory, network, date/time)

### Application Rules (`applications.json`)
- Schema: `https://raw.githubusercontent.com/LGUG2Z/komorebi/master/schema.asc.json`
- Extensive application-specific window management rules covering:
  - Applications to ignore from tiling
  - Multi-window and tray applications
  - Floating window exceptions
  - Slow application handling
  - Object name change configurations

## Development Workflow

This is a configuration-only repository with no build, test, or lint commands. Changes are made directly to the JSON files and take effect when komorebi is reloaded or restarted.

### Making Configuration Changes
1. Edit the relevant JSON configuration file
2. Validate JSON syntax
3. Reload komorebi configuration or restart the window manager
4. Test the changes in the window management behavior

### Configuration Validation
- JSON files should be validated against their respective schemas
- Schema URLs are provided in each configuration file's `$schema` property
- Use a JSON validator or editor with schema support for validation

## Key Configuration Patterns

### Theme Consistency
All configuration files use consistent theming:
- Palette: Base16
- Theme: GruvboxDarkHard
- Accent: Base0D

### Application Rule Structure
Application rules in `applications.json` follow patterns:
- `ignore`: Applications excluded from window management
- `manage`: Applications explicitly managed
- `floating`: Applications that should float instead of tile
- `tray_and_multi_window`: Applications with system tray or multiple windows
- `object_name_change`: Applications that change their window titles dynamically
- `slow_application`: Applications that need special handling due to slow startup

When adding new application rules, follow the existing pattern of matching by executable name, window class, or title, and specify the appropriate matching strategy.