"Neovim Specific
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    language en_US
    set noshowcmd
    "Slime
    let g:slime_target = "neovim"

    "Monokai
    let g:vim_monokai_tasty_italic = 1

else
    "Mac Specific
    set macligatures
    set macmeta
    set laststatus=2

    "Slime
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
set nocompatible
set hidden
syntax enable

"Splits
set splitbelow
set splitright

"Mouse
set mouse=a
set mousehide

"Encoding
scriptencoding utf-8
set encoding=utf-8

"Indent
set smartindent
set copyindent

"Tabs
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"Visual
set number relativenumber
set wrap linebreak nolist
set showtabline=0
set cursorline

"Searching
set ignorecase
set smartcase

"Folding
set foldnestmax=10
set nofoldenable
set foldlevel=2

"More CLI
set t_Co=256
set vb
set t_ut=""

"Mappings
let mapleader = "-"

"-----Plugins-----

"VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Use object gn instead of multicursor
Plug 'scrooloose/nerdtree'
Plug 'jupyter-vim/jupyter-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tikhomirov/vim-glsl'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'vim-scripts/greplace.vim'
Plug 'lervag/vimtex'
Plug 'jpalardy/vim-slime'
Plug 'shime/vim-livedown'
Plug 'jesseleite/vim-noh'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Hovushka/vim-monokai-tasty'
Plug 'jceb/vim-orgmode'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-repeat'
" Plug 'lyokha/vim-xkbswitch'
call plug#end()

"Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"NERDTree
let g:webdevicons_conceal_nerdtree_brackets=0

"Omnisharp
let g:OmniSharp_server_stdio = 1

"COC-extensions
let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-python' , 'coc-ccls', 'coc-highlight' ]

"COC-tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"COC-snippets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"COC-lightline
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
        let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ')
endfunction

"Lightline
let g:lightline = {
            \ 'component_function': {
            \       'filetype': 'MyFiletype',
            \       'fileencoding': 'MyFileEncoding',
            \       'cocstatus': 'coc#status',
            \       'statusdiagnostic': 'StatusDiagnostic',
            \       'lang': 'MyLangShower',
            \     },
            \ 'component': {
            \       'lineinfo': "%1{line('.') . '/' . line('$')}:%-1v",
            \     },
            \ }


let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified' ],
            \            ],
            \ 'right': [ [ 'statusdiagnostic' ],
            \            [ 'lineinfo' ],
            \            [ 'fileencoding', 'filetype' ] ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'filename' ] ],
            \ 'right': [ [ 'lineinfo' ] ] }

let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

"Lightline-custom-section
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ?
        \ &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileEncoding()
    return winwidth(0) > 70 ?
        \ (&fileencoding . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"Startify
let g:startify_custom_header = []

"Xkbswitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'

"Ultisnips
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"Easymotion
map <Leader> <Plug>(easymotion-prefix)

"Fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

"vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

"AutoPairs
let g:AutoPairsMultilineClose = 0

"Monokai
colorscheme vim-monokai-tasty

"Autoformat
nnoremap <F4> :Autoformat<CR>

"Rainbow
let g:rainbow_active = 1

"Regular bindings
vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

"Space bindings
nnoremap <Space>a ggVG
vnoremap <Space>c "+y
nnoremap <Space>v "+p
nnoremap <Space>s :w<CR>

nnoremap <Space>i :PlugInstall<CR>
nnoremap <Space>u :PlugUpdate<CR>

nnoremap <Space>m :LivedownToggle<CR>
nnoremap <Space>j :call jupyter#Connect()<CR>

nnoremap <Space>e :e ~/.vimrc<CR>
nnoremap <Space>w :source ~/.vimrc<CR>
            \:echom "~/.vimrc is sourced"<CR>

nnoremap <Space>o :copen<CR>
nnoremap <Space>l :lopen<CR>
nnoremap <Silent> <Space>q :q!<CR>

"Function bindings
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <F2> :w !sudo tee % <CR>
            \:echom "forced changes to the file" <CR>
nnoremap <F3> :AsyncRun ctags -R<CR>
nnoremap <F4> :Autoformat<CR>
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>

"Filename completion
inoremap <F7> <C-X><C-]>
"Context-aware completion
inoremap <F8> <C-X><C-P>
"Line completion
inoremap <F9> <C-X><C-L>

"Custom commands

if has("nvim")
    command! -nargs=0 GetTermId :echom b:terminal_job_id
    command! -nargs=* Term :split term://<args> | :GetTermId
endif

"stoeffel/.dotfiles
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

command! -nargs=* Blender :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ <args>
command! -nargs=? Blend :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -b -P % -- <args>
command! -nargs=? Blendo :!/Applications/Blender/blender.app/Contents/MacOS/blender
            \ -P % -- <args>

"Auto commands
augroup hovagroup
    autocmd!
    " autocmd! BufWritePost,BufEnter * Neomake
    if has('nvim')
        autocmd TermOpen * startinsert
    endif
    autocmd VimEnter * echom ">^.^< : config by Hova"
augroup END
