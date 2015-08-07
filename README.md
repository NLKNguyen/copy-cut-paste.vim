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

**Default**

| Mode   | Key  | Action                                 |
| ---    | ---  | ---                                    |
| Normal | `QC` | Copy a whole line to system clipboard  |
| Visual | `QC` | Copy selected text to system clipboard |
| Normal | `QX` | Cut a whole line to system clipboard   |
| Visual | `QX` | Cut selected text to system clipboard  |
| Normal | `QV` | Paste from system clipboard            |

To turn off default keymapping and use your own:

```VIML
let g:copy_cut_paste_no_mappings = 1

" Use your keymap
nmap QC <Plug>CCP_CopyLine
vmap QC <Plug>CCP_CopyText

nmap QX <Plug>CCP_CutLine
vmap QX <Plug>CCP_CutText

nmap QV <Plug>CCP_PasteText
```

-------
Pasting with smartindent automatically turned off temporarily

| Mode   | Key                                                                                                  |
| ---    | ---                                                                                                  |
| Insert | Use your terminal key for pasting, for example `Ctrl+Shitf+V` in Ubuntu and `Shift+Insert` in Cygwin |

# Install

Using [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager:

```VIML
Plugin 'NLKNguyen/copy-cut-paste.vim'
```

Or manually: copy `copy-cut-paste.vim` file to your `~/.vim/plugin/` directory

# License
Same as Vim
