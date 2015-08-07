# copy-cut-paste.vim
Keymaps for easy copying, cutting, and pasting between Vim terminal buffer and system clipboard

Require `+clipboard`

To check:

```BASH
vim --version | grep clipboard
```

If not available and you're on Ubuntu, the fastest way to have it is through this package:

```BASH
sudo apt-get install vim-gtk
```

# Keymaps

| Mode   | Key  | Action                                 |
| ---    | ---  | ---                                    |
| Normal | `QC` | Copy a whole line to system clipboard  |
| Visual | `QC` | Copy selected text to system clipboard |
| Normal | `QX` | Cut a whole line to system clipboard   |
| Visual | `QX` | Cut selected text to system clipboard  |
| Normal | `QV` | Paste from system clipboard            |

Pasting with smartindent automatically turned off temporarily

| Mode   | Key                                                                                                  |
| ---    | ---                                                                                                  |
| Insert | Use your terminal key for pasting, for example `Ctrl+Shitf+V` in Ubuntu and `Shift+Insert` in Cygwin |
