scriptencoding utf-8 "VimScript files use UTF-8

"Basic configuration
set nocompatible		"No compatibility with Vi
filetype plugin indent on	"Language detection
syntax enable			"Syntax highlighting
set termguicolors		"Full color mode
set hidden			"Do not close unsaved files
"language en_US			"Set interface language
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
"set foldmethod=manual		"Manual folding
"set foldnestmax=10		"Maximum folding depth
"set foldlevelstart=99		"Open file unfolded, screws with 'zm' (Use zM and zR)
"set nofoldenable		"Start unfolded, enable and disable folds by 'zc'
set visualbell			"Disable annoying beeping
let mapleader="-"		"Prefix for mappings
let maplocalleader="\\"		"Scond prefix for mappings

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
"Format buffer
nnoremap <Space>f mzgg=G`z
"Remove trailing whitespace
nnoremap <Space>t :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
    \:echom "whitespace deleted"<CR>
"Turn off highlight
nnoremap <silent> <Space>h :noh<CR>

"Basic autocommands
augroup basicgroup
	autocmd!
	autocmd BufRead * normal zR 				"Open file unfolded
	autocmd FileType c,cpp setlocal equalprg=clang-format	"gg=G uses clang-format
        autocmd TermOpen * startinsert                          "Start terminal in insert mode
augroup END
