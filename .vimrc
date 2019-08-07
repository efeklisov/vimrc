"General
filetype plugin indent on
syntax on
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
set guifont=Fira\ Code\ light:h15
set macligatures
set macmeta
set copyindent
let mapleader = "-"
set wrap
set cursorline

"Fix cursor in Mac Term
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"

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
Plug 'elzr/vim-json'
Plug 'vim-scripts/greplace.vim'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'szw/vim-tags'
call plug#end()

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_compiler_options = " -std=c++17 "

"Neomake
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-I/usr/local/include/wx-3.0', '-std=c++17'],
   \ }

" let g:neomake_hpp_clang_maker = {
"    \ 'exe': 'clang++',
"    \ 'args': ['-I/usr/local/include/wx-3.0'],
"    \ }

"vimtex
let g:tex_flavor = 'latex'

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
let g:vim_tags_ignore_files = ['.gitignore']
let g:vim_tags_main_file = '.tags'
noremap <silent> <F3> :TagsGenerate!<CR>
        \:echom "generating tags"<CR>

"YouCompleteMe
imap <D-Space> <Nul>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_show_diagnostics_ui = 0

"CtrlSpace for MacVim
nnoremap <silent><Space> :CtrlSpace o<CR>
let g:CtrlSpaceIgnoredFiles = '\v(build|final)[\/]'
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:ctrlspace_use_mouse_and_arrows = 1

"Monocai MacVim
set guioptions=
if has('gui_running')
    set background=dark
    colorscheme sublimemonokai
endif

"Autoformat
nnoremap <F4> :Autoformat<CR>

"Surround
" let g:surround_no_mappings = 1
" nmap <leader>d <Plug>Dsurround
" nmap <leader>c <Plug>Csurround
" nmap <leader>y <Plug>Ysurround
" xmap <leader>v <Plug>VSurround
" imap <c-g>s <Plug>Isurround

"-----------------

"Custom maps
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
            \:echom "~/.vimrc is sourced"<CR>
nnoremap <silent> <F1> :Lexplore<CR>
nnoremap <F2> :w !sudo tee % <CR>
            \:echom "forced changes to the file" <CR>
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>
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

"Custom commands
command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ <args>
command! -nargs=? Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -b -P % -- <args>
command! -nargs=? Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -P % -- <args>
command! -nargs=? Ls :!ls <args>

"Auto commands
augroup hovagroup
    autocmd!
    autocmd! BufWritePost,BufEnter * Neomake
    autocmd VimEnter * echom ">^.^< : config by Hova"
    "if has('gui_running')
    "    autocmd CursorMovedI * redraw!
    "endif
augroup END
