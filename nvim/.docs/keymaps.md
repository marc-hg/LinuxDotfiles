# LazyVim Default Keymaps

Leader: `<Space>` | Local leader: `\`

## General

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Window navigation |
| `<C-Arrow>` | Resize window |
| `<A-j/k>` | Move line down/up |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<C-s>` | Save file |
| `<leader>qq` | Quit all |
| `<leader>gg` | Lazygit (root) |
| `<leader>gG` | Lazygit (cwd) |

## Buffers

| Key | Action |
|---|---|
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Delete other buffers |
| `<leader>bD` | Delete buffer + window |

## Files / Search (`<leader>f`, `<leader>s`)

| Key | Action |
|---|---|
| `<leader><space>` | Find files (root) |
| `<leader>ff` | Find files (root) |
| `<leader>fF` | Find files (cwd) |
| `<leader>fr` | Recent files |
| `<leader>/` | Grep (root) |
| `<leader>sg` | Grep (root) |
| `<leader>sG` | Grep (cwd) |
| `<leader>ss` | Goto symbol |
| `<leader>sS` | Goto symbol (workspace) |
| `<leader>sw` | Search word under cursor |

## LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `gD` | Go to declaration |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename |
| `<leader>cf` | Format |
| `<leader>cd` | Line diagnostics |
| `]d` / `[d` | Next/prev diagnostic |
| `]e` / `[e` | Next/prev error |
| `]w` / `[w` | Next/prev warning |

## UI Toggles (`<leader>u`)

| Key | Toggle |
|---|---|
| `<leader>uf` | Auto-format (buffer) |
| `<leader>uF` | Auto-format (global) |
| `<leader>us` | Spell check |
| `<leader>uw` | Word wrap |
| `<leader>ud` | Diagnostics |
| `<leader>ul` | Line numbers |
| `<leader>uL` | Relative line numbers |
| `<leader>ub` | Dark background |
| `<leader>uh` | Inlay hints |
| `<leader>uT` | Treesitter highlight |
| `<leader>ug` | Gitsigns |
| `<leader>uG` | Gitsigns (global) |
| `<leader>uz` | Zen mode |
| `<leader>uD` | Dimming |
| `<leader>ua` | Animations |

## Git (`<leader>g`, `<leader>gh`)

| Key | Action |
|---|---|
| `<leader>gb` | Git blame line |
| `<leader>gB` | Git browse |
| `<leader>ghb` | Blame line |
| `<leader>ghd` | Diff this |
| `<leader>ghD` | Diff this ~ |
| `<leader>ghs` | Stage hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghR` | Reset buffer |
| `<leader>ghp` | Preview hunk |
| `]h` / `[h` | Next/prev hunk |

## Diagnostics / Trouble (`<leader>x`)

| Key | Action |
|---|---|
| `<leader>xx` | Document diagnostics |
| `<leader>xX` | Workspace diagnostics |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |
| `<leader>cs` | Symbols (Aerial/Outline) |
| `<leader>cS` | LSP references/symbols |
| `[q` / `]q` | Prev/next quickfix |

## Editor Plugins

| Key | Action |
|---|---|
| `<leader>sr` | Search & replace (grug-far) |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `<leader>xt` | Todo (trouble) |
| `<leader>xT` | Todo/Fix/Fixme (trouble) |
| `<leader>st` | Todo (search) |
| `<leader>sT` | Todo/Fix/Fixme (search) |

## Treesitter Textobjects (nvim-treesitter-textobjects)

| Key | Action |
|---|---|
| `]f` / `[f` | Next/prev function start |
| `]F` / `[F` | Next/prev function end |
| `]c` / `[c` | Next/prev class start |
| `]C` / `[C` | Next/prev class end |
| `]a` / `[a` | Next/prev parameter |

## Sessions (`<leader>q`)

| Key | Action |
|---|---|
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Don't save current session |
| `<leader>qS` | Select session |

## Terminal / Scratch

| Key | Action |
|---|---|
| `<C-/>` | Terminal (root) |
| `<C-_>` | Terminal (root, alt) |
| `<leader>fT` | Terminal (cwd) |

## Testing (`<leader>t` — requires test extra)

| Key | Action |
|---|---|
| `<leader>tt` | Run nearest test |
| `<leader>tT` | Run file |
| `<leader>ta` | Run all tests |
| `<leader>tl` | Run last |
| `<leader>ts` | Toggle summary |
| `<leader>to` | Toggle output panel |
| `<leader>tO` | Show output |
| `<leader>td` | Debug nearest |

## DAP Debugging (`<leader>d` — requires dap extra)

| Key | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Breakpoint condition |
| `<leader>dc` | Continue |
| `<leader>dC` | Run to cursor |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Toggle REPL |
| `<leader>ds` | Session |
| `<leader>dt` | Terminate |
| `<leader>dw` | Widgets |
