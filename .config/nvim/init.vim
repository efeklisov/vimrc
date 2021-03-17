scriptencoding utf-8 "VimScript files use UTF-8

"Install plugins
call plug#begin(stdpath('data') . '/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'Hovushka/vim-monokai-tasty'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-startify'
    Plug 'tikhomirov/vim-glsl'
    Plug 'jesseleite/vim-noh'
    Plug 'tmsvg/pear-tree'
    Plug 'itchyny/lightline.vim'

    "Before v0.5
    "Plug 'luochen1990/rainbow'
    "Plug 'jackguo380/vim-lsp-cxx-highlight'
    "Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    "New Era
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"Color scheme
colorscheme vim-monokai-tasty       "Set theme
let g:vim_monokai_tasty_italic=1    "Support italic

"Basic configuration
set nocompatible		"No compatibility with Vi
filetype plugin indent on	"Language detection
syntax enable			"Syntax highlighting
set termguicolors		"Full color mode
set hidden			"Do not close unsaved files
" language en_US		"Set interface language
set noshowcmd			"Do not show last command
set noshowmode			"Do not show mode in cmd
set splitbelow			"Horizontal splits go downwards
set splitright			"Vertical splits go to the right
set mouse=a			"Full-featured mouse
set mousehide			"Hide system cursor after a while
set encoding=utf-8		"Editor's encoding is UTF-8 (not file's)
set autoindent			"Repeat indent if fyletype has none
set expandtab			"Tabs are spaces now
set shiftwidth=4		"Visible width of a tab
set softtabstop=4		"Amount of spaces in a tab
set number relativenumber	"Relative line numbers with absolute current
set nowrap linebreak nolist	"Break lines by words
set showtabline=0		"Hide buffer list on top
set cursorline			"Highlight current line
set ignorecase			"Ignore case when searching
set smartcase			"Case sensitive search if has uppercase letters
set foldmethod=syntax		"Syntax folding
" set foldmethod=manual		"Manual folding
" set foldnestmax=10		"Maximum folding depth
" set foldlevelstart=99		"Open file unfolded, screws with 'zm' (Use zM and zR)
" set nofoldenable		"Start unfolded, enable and disable folds by 'zc'
set visualbell			"Disable annoying beeping
let mapleader="-"		"Prefix for mappings
let maplocalleader="\\"		"Scond prefix for mappings

"Basic settings relevant to plugins
" set nobackup                  "Disable backup 1
" set nowritebackup             "Disable backup 2
set updatetime=300              "Shorter update delay for plugins
set shortmess+=c                "Don't pass messages to completion menu

"Basic commands
"Run terminal command in a split
command! -nargs=* Term :split term://<args>

"Basic mappings
"Turn off ex mode
nnoremap Q <Nop>
"Conform 'Y' to 'D' and 'C'
nnoremap Y y$
"Move within wraped line
vnoremap <Up> gk
vnoremap <Down> gj
"Copy text. Do NOT map <Esc> to anything if you use it
vnoremap <C-c> "+y
"Select whole text
nnoremap <Space>a ggVG
"Save file
nnoremap <Space>s :w<CR>
"Edit config
nnoremap <Space>e :e ~/.config/nvim/init.vim<CR>
"Source config
nnoremap <Space>w :source ~/.config/nvim/init.vim<CR>
    \:echom "~/.vimrc is sourced"<CR>
"Open location list
nnoremap <Space>l :lopen<CR>
"Close location list
nnoremap <Space>q :lclose<CR>
"Remove trailing whitespace
nnoremap <Space>t :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
    \:echom "whitespace deleted"<CR>
"Turn off highlight
nnoremap <silent> <Space>h :noh<CR>

"Basic autocommands
augroup basicgroup
	autocmd!
	autocmd BufRead * normal zR 				"Open file unfolded, but doesn't work consistently
	autocmd FileType c,cpp setlocal equalprg=clang-format	"gg=G uses clang-format
        autocmd TermOpen * startinsert                          "Start terminal in insert mode
augroup END

"Plugins' configuration

"Vim-Plug
"Install new plugins
nnoremap <Space>i :PlugInstall<CR>
"Update all plugins
nnoremap <Space>u :PlugUpdate<CR>

"Startify
let g:startify_custom_header = []   "Turn off the cow

"Pear Tree
let g:pear_tree_repeatable_expand = 0   "Put closing curly bracket on CR
"Smart portion of the plugin
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"Rainbow
let g:rainbow_active = 1

"Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

"Colorizer
lua require'colorizer'.setup()

"TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "lua"},
  highlight = {
    enable = true,
  },
}
EOF

"Lightline
let g:lightline = {
            \ 'component_function': {
            \     },
            \ 'component': {
            \       'lineinfo': "%1{line('.') . '/' . line('$')}:%-1v",
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
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

"COC-NVIM
"Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Trigger completion in place
inoremap <silent><expr> <c-space> coc#refresh()

"Show documentaion on hover
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Highlight symbol on hover
autocmd CursorHold * silent call CocActionAsync('highlight')

"Browse diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Rename symbol
nmap <leader>rn <Plug>(coc-rename)

"Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"Format selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>

"Clangd switch source and header
nnoremap <Space>r :CocCommand clangd.switchSourceHeader<CR>

"Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"Invoke explorer
nnoremap <silent> <F2> :CocCommand explorer --width 30 --toggle --focus --quit-on-open<CR>

"Installed extensions
let g:coc_global_extensions=[ 'coc-python' , 'coc-json', 'coc-clangd', 'coc-vimlsp', 'coc-explorer', 'coc-cmake' ]

augroup plugingroup
    autocmd!
    autocmd BufNewFile,BufRead *.rchit,*.rgen,*.rmiss set filetype=glsl
augroup END
