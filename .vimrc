"Neovim Specific
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    language en_US
    set noshowcmd
else
"Mac Specific
    set macligatures
    set macmeta

    "Custom commands
    command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender
                \ <args>
    command! -nargs=? Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender
                \ -b -P % -- <args>
    command! -nargs=? Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender
                \ -P % -- <args>

"GUI Specific
    if has('gui_running')
        set guioptions=
        set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16
        set background=dark
    else
"CLI Specific
        set ttimeoutlen=10
        let &t_SI.="\e[5 q" "SI = INSERT mode
        let &t_SR.="\e[3 q" "SR = REPLACE mode
        let &t_EI.="\e[1 q" "EI = NORMAL mode
    endif
endif

"General
filetype plugin indent on
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
set number relativenumber
set mouse=a
set copyindent
let mapleader = "-"
set wrap linebreak nolist
set cursorline

set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0

"Folding
set foldnestmax=10
set nofoldenable
set foldlevel=2

"-----Plugins-----

"VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'jupyter-vim/jupyter-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tikhomirov/vim-glsl'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'vim-scripts/greplace.vim'
Plug 'lervag/vimtex'
Plug 'jpalardy/vim-slime'
Plug 'neomake/neomake'
Plug 'milkypostman/vim-togglelist'
Plug 'shime/vim-livedown'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"Neomake
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-I/usr/local/include/wx-3.0', '-std=c++17'],
   \ }

"VimSlime
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1

"vimtex
let g:tex_flavor = 'latex'

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-CR>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"AutoPairs
let g:AutoPairsMultilineClose = 0

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_show_diagnostics_ui = 0

"CtrlSpace for MacVim
nnoremap <silent><Space> :CtrlSpace o<CR>
let g:CtrlSpaceIgnoredFiles = '\v(build|final|MacVim|tests)[\/]'
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:ctrlspace_use_mouse_and_arrows = 1

"Monocai MacVim
colorscheme sublimemonokai

"Autoformat
nnoremap <F4> :Autoformat<CR>

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'

"Custom maps
vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <C-A> ggVG
vnoremap <C-C> "+y
nnoremap <leader>ld :LivedownToggle<CR>
inoremap <C-Space> <C-^>
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
            \:echom "~/.vimrc is sourced"<CR>
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <F2> :w !sudo tee % <CR>
            \:echom "forced changes to the file" <CR>
nnoremap <leader>jc :call jupyter#Connect()<CR>
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>

inoremap £ #
inoremap ™ `
inoremap • *

"Insert from unnamed buffer
inoremap <F6> <C-R>"
"Tag completion
inoremap <F7> <C-X><C-]>
"Filename completion
inoremap <F8> <C-X><C-]>
"Context-aware completion
inoremap <F9> <C-X><C-P>
"Line completion
inoremap <F10> <C-X><C-L>
"Open error
nnoremap <script> <silent> <F12> :call ToggleLocationList()<CR>


"Auto commands
augroup hovagroup
    autocmd!
    autocmd! BufWritePost,BufEnter * Neomake
    autocmd VimEnter * echom ">^.^< : config by Hova"
augroup END
