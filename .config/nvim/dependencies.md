**Package names are written according to Arch repos**

# My Terminal
- kitty
- nerd-fonts-fira-code (AUR)

# Checkhealth
I recommend running this before doing anything
```Vim
:checkhealth
```
## Fix Clipboard
- xclip // X11
- wl-clipboard // Wayland

## Install Providers for Plugins
```bash
pip install neovim
npm install -g neovim # Fix priviliges before this
```

### Fix priviliges for npm on Linux
```bash
mkdir ~/.cache/npm-global
npm config set prefix '~/.cache/npm-global'
export PATH=~/.cache/npm-global/bin:$PATH // .profile
```

# Vim Plug
## Installation
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Commands
```Vim
:PlugInstall
:PlugUpdate
```

# COC
- nodejs
- nmp

Note that all language servers with a COC extension can be auto-installed on first run

## C/C++
~~- clang // to get clangd clang-format~~
- compiledb (AUR) // to get for the project compile_commands.json

For example: 
```bash
alias make='compiledb make -j 16 && mv --force compile_commands.json ..'
```

## Python Language Server
~~- pyright~~

## Vimscript Language Server
~~npm install -g vim-language-server~~

# Ag
- fzf
- the_silver_searcher

# Hexokinase
- go
