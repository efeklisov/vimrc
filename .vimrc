"General
filetype on
filetype plugin on
filetype indent on
scriptencoding utf-8
set encoding=utf-8
set nocompatible
set hidden
set showtabline=0
syntax enable
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
set mouse=a
set guifont=Monaco:h14
set copyindent
let mapleader = "-"

"Folding
set foldnestmax=10
set nofoldenable
set foldlevel=2

"-----Plugins-----

"VimPlug
":PlugInstall
" :PlugUpdate
" :PlugClean
" :PlugUpgrade
" :PlugStatus
" :PlugDiff
" :PlugSnapshot

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
Plug 'jpalardy/vim-slime'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Chiel92/vim-autoformat'
Plug 'tikhomirov/vim-glsl'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-CR>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"AutoPairs
let g:AutoPairsMultilineClose = 0

"Slime
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1

"Ctags
set tags=.tags;/
let g:vim_tags_main_file = '.tags'
noremap <F3> :TagsGenerate!<CR>

"YouCompleteMe
imap <D-Space> <Nul>
let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
set completeopt-=preview

"CtrlSpace for MacVim
nnoremap <silent><Space> :CtrlSpace o<CR>

"Monocai MacVim
set guioptions=
if has('gui_running')
    set background=dark
    colorscheme sublimemonokai
endif

"Autoformat
noremap <F4> :Autoformat<CR>

"Surround
let g:surround_no_mappings = 1
nmap <leader>d <Plug>Dsurround
nmap <leader>c <Plug>Csurround
nmap <leader>y <Plug>Ysurround
xmap <leader>v <Plug>VSurround
imap <c-g>s <Plug>Isurround

"-----------------

"Custom maps
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Custom commands
command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender <args>
command! -nargs=0 Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender --background --python %
command! -nargs=0 Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender --python %

autocmd VimEnter * echom ">^.^< : config by Hova"
