"dein Scripts-----------------------------
if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('preservim/nerdtree')

    call dein#add('neovim/nvim-lspconfig')
    call dein#add('nvim-lua/diagnostic-nvim')
    call dein#add('nvim-lua/completion-nvim')

    call dein#add('vimwiki/vimwiki')
    call dein#add('ajh17/VimCompletesMe')
    " call dein#add('jupyter-vim/jupyter-vim')
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('tikhomirov/vim-glsl')
    call dein#add('itchyny/lightline.vim')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('elzr/vim-json')
    " call dein#add('vim-scripts/greplace.vim')
    call dein#add('rking/ag.vim')
    call dein#add('lervag/vimtex')
    " call dein#add('jpalardy/vim-slime')
    call dein#add('shime/vim-livedown')
    call dein#add('jesseleite/vim-noh')
    call dein#add('skywind3000/asyncrun.vim')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('tpope/vim-fugitive')
    call dein#add('luochen1990/rainbow')
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')
    " call dein#add('easymotion/vim-easymotion')
    call dein#add('mhinz/vim-startify')
    " call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    call dein#add('Hovushka/vim-monokai-tasty')
    call dein#add('tmsvg/pear-tree')
    call dein#add('tpope/vim-repeat')
    " call dein#add('ajh17/VimCompletesMe')
    " call dein#add('dense-analysis/ale')
    " call dein#add('rrethy/vim-hexokinase', { 'build': 'make hexokinase' })
    call dein#add('norcalli/nvim-colorizer.lua')
    call dein#add('octol/vim-cpp-enhanced-highlight')
    " call dein#add('ap/vim-css-color')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('godlygeek/tabular')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"After commenting out
" call map(dein#check_clean(), "delete(v:val, 'rf')")
"After removing plugin entirely
" call dein#recache_runtimepath()
"End dein Scripts-------------------------

"General
set termguicolors
set hidden
language en_US
set noshowcmd
set noshowmode

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
set nowrap linebreak nolist
" set nowrap
set showtabline=0
set cursorline

"Searching
set ignorecase
set smartcase

"Folding
set foldnestmax=10
set foldlevel=2
set nofoldenable
set foldlevelstart=0

"More CLI
set t_Co=256
set vb
set t_ut=""

"Mappings
let mapleader = "-"

"Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

"Lua Colorizer
lua require'colorizer'.setup()

"Indent line
let g:indentLine_enabled = 0
let g:indentLine_faster = 1
let g:indentLine_char = '¬∑'
let g:indentLine_leadingSpaceChar = '¬∑'
let g:indentLine_leadingSpaceEnabled = 1

"Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"NERDTree
let g:webdevicons_conceal_nerdtree_brackets=0

"ALE
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_python_pylint_options = "--ignored-modules=tensorflow.keras --disable=C,R,E1136"
let g:ale_glsl_glslang_options = "-V -o shaders/.lint.spv"
" let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wno-unused-const-variable -Wno-unused-function'
let g:ale_linters = {'cpp': [], 'cs': ['OmniSharp']}
" let g:ale_linters = {'cpp': ['clangtidy'], 'cs': ['OmniSharp']}
" let g:ale_fixers = {'cpp': ['clangtidy']}

"Omnisharp
let g:OmniSharp_server_stdio = 1

"NVIM LSP
lua require'nvim_lsp'.clangd.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.cmake.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.vimls.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.pyls.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.omnisharp.setup{on_attach=require'diagnostic'.on_attach}

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1

let g:vcm_direction = 'n'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ completion#trigger_completion()

set completeopt=menuone,noinsert,noselect
" set updatetime=1000

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <Space><Space>    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

"Lightline
let g:lightline = {
            \ 'component_function': {
            \     },
            \ 'component': {
            \       'lineinfo': "ÓÇ°%1{line('.') . '/' . line('$')}:%-1v",
            \     },
            \ }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified' ],
            \            ],
            \ 'right': [ [ ],
            \            [ 'lineinfo' ],
            \             ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'filename' ] ],
            \ 'right': [ [ 'lineinfo' ] ] }

let g:lightline.separator = {
            \   'left': 'ÓÇ∞', 'right': 'ÓÇ≤'
            \}
let g:lightline.subseparator = {
            \   'left': 'ÓÇ±', 'right': 'ÓÇ≥'
            \}

let s:hidden_status = 0
function! ToggleHiddenStatus()
    if s:hidden_status == 0
        let s:hidden_status = 1
        set laststatus=0
        set ruler
        set showmode
    else
        let s:hidden_status = 0
        set laststatus=2
        set noruler
        set noshowmode
        echo ""
    endif
endfunction

"Slime
let g:slime_target = "neovim"

"Startify
let g:startify_custom_header = []

"Xkbswitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'

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
let g:vim_monokai_tasty_italic = 1

"Autoformat
" nnoremap <F4> :Autoformat<CR>

"Rainbow
let g:rainbow_active = 1

"Regular bindings
nnoremap Q <Nop>
nnoremap Y y$

vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

"Space bindings
nnoremap <Space>a ggVG
vnoremap <Space>c "+y
nnoremap <Space>v "+p
nnoremap <Space>s :w<CR>
nnoremap <silent> <Space>h :call ToggleHiddenStatus()<CR>

nnoremap <Space>i :call dein#install()<CR>
nnoremap <Space>u :call dein#check_update()<CR>
nnoremap <Space>r :call map(dein#check_clean(), "delete(v:val, 'rf')") <bar> call dein#recache_runtimepath()<CR>

nnoremap <Space>m :LivedownToggle<CR>
nnoremap <Space>j :call jupyter#Connect()<CR>

nnoremap <Space>e :e ~/.config/nvim/init.vim<CR>
nnoremap <Space>w :source ~/.config/nvim/init.vim<CR>
            \:echom "~/.vimrc is sourced"<CR>

nnoremap <Space>l :lopen<CR>
nnoremap <Space>q :lclose<CR>

"Function bindings
nnoremap <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <C-o>:NERDTreeToggle<CR>
" nnoremap <F2> :w !sudo tee % <CR>
"             \:echom "forced changes to the file" <CR>
" nnoremap <F3> :AsyncRun ctags -R<CR>
nnoremap <F4> mzgg=G`z
nnoremap <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
            \:echom "whitespace deleted"<CR>

"Since my down key is broken
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

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
    if has('nvim')
        autocmd TermOpen * startinsert
    endif

    autocmd BufEnter * lua require'completion'.on_attach()
    autocmd Filetype c,cpp,vim,cmake,python,cs setlocal omnifunc=v:lua.vim.lsp.omnifunc
    " autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
    autocmd FileType c,cpp setlocal equalprg=clang-format

    autocmd VimEnter * echom ">^.^< : config by Hova"
augroup END
