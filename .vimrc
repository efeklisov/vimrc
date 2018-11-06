filetype on
filetype plugin on
filetype indent on
" :PlugInstall
" :PlugUpdate
" :PlugClean
" :PlugUpgrade
" :PlugStatus
" :PlugDiff
" :PlugSnapshot
call plug#begin('~/.vim/bundle')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jpalardy/vim-slime'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'szw/vim-tags'
call plug#end()
scriptencoding utf-8
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1
set encoding=utf-8
let g:surround_no_mappings = 1
nmap zd  <Plug>Dsurround
nmap zc  <Plug>Csurround
nmap zs  <Plug>Ysurround
nmap zS  <Plug>YSurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
set tags=.tags;/
let g:vim_tags_main_file = '.tags'
imap <C-S> <Plug>Isurround
set nocompatible
set hidden
set showtabline=0
imap <D-Space> <Nul>
map <S-Up> <C-u>
map <S-Down> <C-d>
map <S-Left> <C-b>
map <S-Right> <C-f>
nnoremap <silent><Space> :CtrlSpace o<CR>
syntax enable
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>,№;#
set guioptions=
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
set mouse=a
set clipboard=unnamed
set guifont=Monaco:h14
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
let g:AutoPairsShortcutToggle = 'π'
let g:AutoPairsShortcutFastWrap = '´'
let g:AutoPairsShortcutJump = '˜'
let g:AutoPairsShortcutBackInsert = '∫'
au BufWrite * :Autoformat
au BufWrite * :TagsGenerate!
noremap gi i <Esc>r
noremap ga a <Esc>r
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_open_loclist_on_ycm_diags = 1
nmap gt :NERDTreeToggle<CR>
set laststatus=2
"let g:ycm_semantic_triggers = { 'c': [ 're!\w{1}' ] }
