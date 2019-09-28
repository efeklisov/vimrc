"Neovim Specific
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    language en_US
    set noshowcmd
    let g:slime_target = "neovim"
else
"Mac Specific
    set macligatures
    set macmeta

    "VimSlime
    let g:slime_target = "vimterminal"
    let g:slime_python_ipython = 1
"GUI Specific
    if has('gui_running')
        set guioptions=
        set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16
        set background=dark
    else
"CLI Specific
        " set ttimeoutlen=10
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
Plug 'scrooloose/nerdtree'
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
Plug 'shime/vim-livedown'
Plug 'jesseleite/vim-noh'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lyokha/vim-xkbswitch'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

"Neomake
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-I/usr/local/include/wx-3.0', '-std=c++17'],
   \ }

let g:neomake_python_pep8_exe = 'python3'
let g:neomake_python_enabled_makers = ['pep8']

" let g:neomake_hpp_clang_maker = {
"    \ 'exe': 'clang++',
"    \ 'args': ['-I/usr/local/include/wx-3.0'],
"    \ }

"Xkbswitch
let g:XkbSwitchEnabled = 1

"Fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

"vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

"Ultisnips
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"AutoPairs
let g:AutoPairsMultilineClose = 0

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_show_diagnostics_ui = 0

"CtrlSpace for MacVim
" nnoremap <silent><Space> :CtrlSpace o<CR>
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
let g:airline_section_z = "\ue0a1:%l/%L:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0

"Rainbow
let g:rainbow_active = 1

vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <Esc>a ggVG
vnoremap <Esc>c "+y
nnoremap <Esc>s :w<CR>

nnoremap <leader>ld :LivedownToggle<CR>
nnoremap <leader>jc :call jupyter#Connect()<CR>
" nnoremap <leader>md :MarkdownPreview<CR>
" inoremap <C-Space> <C-^>
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
            \:echom "~/.vimrc is sourced"<CR>
" nnoremap <leader>ev :e $MYVIMRC<CR>
" nnoremap <leader>sv :source $MYVIMRC<CR>
"             \:echom "~/.vimrc is sourced"<CR>
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <F2> :w !sudo tee % <CR>
            \:echom "forced changes to the file" <CR>
nnoremap <F3> :AsyncRun ctags -R<CR>
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>

"Filename completion
inoremap <F7> <C-X><C-]>
"Context-aware completion
inoremap <F8> <C-X><C-P>
"Line completion
inoremap <F9> <C-X><C-L>
"Lists
nnoremap <leader>o :copen<CR>
nnoremap <leader>l :lopen<CR>
"No ex mode
nnoremap Q :q<CR>

"Custom commands
command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ <args>
command! -nargs=? Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -b -P % -- <args>
command! -nargs=? Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -P % -- <args>

"Auto commands
augroup hovagroup
    autocmd!
    autocmd! BufWritePost,BufEnter * Neomake
    autocmd VimEnter * echom ">^.^< : config by Hova"
augroup END
