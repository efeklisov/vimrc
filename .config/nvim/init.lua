---- Auto install Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

---- Plugin list

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Productivity
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', requires = { 'nvim-telescope/telescope.nvim' }, run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { 'kelly-lin/telescope-ag', requires = { 'nvim-telescope/telescope.nvim' } }
    use { 'AckslD/nvim-neoclip.lua', requires = { {'tami5/sqlite.lua', module = 'sqlite'}, 'nvim-telescope/telescope.nvim' } }
    use { 'tmsvg/pear-tree' }
    use { 'bkad/CamelCaseMotion' }

    -- Fanciness
    use 'mhinz/vim-startify'
    use 'norcalli/nvim-colorizer.lua'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'sainnhe/sonokai', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

---- Basic configuration

vim.o.termguicolors = true		-- Full color mode
vim.o.showcmd = false			-- Do not show last command
vim.o.showmode = false			-- Do not show mode in cmd
vim.o.splitbelow = true			-- Horizontal splits go downwards
vim.o.splitright = true			-- Vertical splits go to the right
-- vim.o.mouse=a		        -- Full-featured mouse
vim.o.mouse = nil               	-- Disabled mouse
vim.o.mousehide = true			-- Hide system cursor after a while
vim.o.expandtab = true			-- Tabs are spaces now
vim.o.shiftwidth = 4			-- Visible width of a tab
vim.o.softtabstop = 4			-- Amount of spaces in a tab
vim.o.number = true             	-- Relative line numbers with absolute current #1
vim.o.relativenumber = true		-- Relative line numbers with absolute current #2
vim.o.signcolumn='number'       	-- Squash sign and number columns
vim.o.wrap = true               	-- Break lines by words #1
vim.o.linebreak = true          	-- Break lines by words #2
vim.o.list = false	        	-- Break lines by words #3
vim.o.showtabline = 0			-- Hide buffer list on top
vim.o.cursorline = true			-- Highlight current line
vim.o.ignorecase = true			-- Ignore case when searching
vim.o.smartcase = true			-- Case sensitive search if has uppercase letters
-- vim.o.foldmethod='syntax'		-- Syntax folding
vim.o.foldmethod = 'manual'	        -- Manual folding
vim.o.foldnestmax = 10	                -- Maximum folding depth
vim.o.foldlevelstart = 99	        -- Open file unfolded, screws with 'zm' (Use zM and zR)
vim.o.foldenable = true	                -- Start unfolded, enable and disable folds by 'zc'
vim.o.conceallevel = 0          	-- Do not hide syntax in languages like markdown
-- vim.o.backup = false                 -- Disable backup #1
-- vim.o.writebackup = false            -- Disable backup #2
vim.o.updatetime = 300          	-- Shorter update delay
vim.opt_global.shortmess:append("c")    -- Don't pass messages to completion menu
vim.o.laststatus = 3                    -- Unified status line

vim.g.mapleader = '-' 			-- Prefix for mappings
vim.g.maplocalleader = '\\' 		-- Second prefix for mappings

---- Basic commands

-- Run terminal command in a split
vim.api.nvim_create_user_command('Term', ':split term://<args>', { nargs = '*' })

---- Basic mappings

vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Learning to fly
-- vim.keymap.set('n', '<leader>l', '<CMD>ls<CR><CMD>b<space>')
-- vim.keymap.set('n', '<F4>', '<CMD>ls<CR><CMD>b<space>')
-- Toggle last two buffers
vim.keymap.set('n', '<leader>o', '<CMD>b#<CR>', { silent = true })

-- Turn off ex mode
vim.keymap.set('n', 'Q', '<Nop>')

-- Conform 'Y' to 'D' and 'C'
vim.keymap.set('n', 'Y', 'y$')

-- Move within wraped line
-- vim.keymap.set('v', '<Up>', 'gk')
-- vim.keymap.set('v', '<Down>', 'gj')

-- Copy text. Do NOT map <Esc> to anything if you use it
vim.keymap.set('v', '<C-c>', '"+y')
-- Your next best bet
vim.keymap.set('v', '<Space>c', '"+y')

-- Select whole text
vim.keymap.set('n', '<Space>a', 'ggVG')

-- Save file
vim.keymap.set('n', '<Space>s', '<CMD>w<CR>')
vim.keymap.set('n', '<C-s>', '<CMD>w<CR>')

-- Edit config
vim.keymap.set('n', '<Space>e', '<CMD>e ~/.config/nvim/init.lua<CR>')
-- Source config
vim.keymap.set('n', '<Space>w', '<CMD>source ~/.config/nvim/init.lua<CR><CMD>echom "config is sourced"<CR>')

-- Open location list
vim.keymap.set('n', '<Space>l', '<CMD>lopen<CR>')

-- Close location list
vim.keymap.set('n', '<Space>q', '<CMD>lclose<CR>')

-- Remove trailing whitespace
vim.keymap.set('n', '<Space>t', '<CMD>let _s=@/ <Bar> <CMD>%s/\\s\\+$//e <Bar> <CMD>let @/=_s <Bar> <CMD>nohl <Bar> <CMD>unlet _s <CR><CMD>echom "whitespace deleted"<CR>')

-- Turn off highlight
vim.keymap.set('n', '<Space>h', '<CMD>noh<CR>', { silent = true })

---- Basic autocommands

local basicname = 'basicgroup'
vim.api.nvim_create_augroup(basicname, { clear = true })

-- Highlight yanked region
vim.api.nvim_create_autocmd('TextYankPost', { group = basicname, pattern = '*', callback = function() vim.highlight.on_yank { higroup="IncSearch", timeout=150, on_visual=true } end })

-- Open file unfolded, but doesn't work consistently
-- vim.api.nvim_create_autocmd('BufRead', { group = basicname, pattern = '*', command = 'normal zMzR'})

-- Sequence g=G uses clang-format
-- vim.api.nvim_create_autocmd('Filetype', {
--     group = basicname,
--     pattern = 'c,cpp',
--     command = 'setlocal equalprg=clang-format'
-- })

-- Start terminal in insert mode
-- vim.api.nvim_create_autocmd('TermOpen', { group = basicname, pattern = '*', command = 'startinsert'})

---- Plugin configs

-- Packer
--
-- Update all plugins
vim.keymap.set('n', '<Space>i', '<CMD>PackerSync<CR>')
vim.keymap.set('n', '<Space>u', '<CMD>PackerSync<CR>')

-- Nvim-Tree
--
require("nvim-tree").setup()

vim.keymap.set('n', '<F2>', '<CMD>NvimTreeToggle<CR>')

-- Pear Tree
--
-- Put closing curly bracket on CR
vim.g.pear_tree_repeatable_expand = 0
-- Smart portion of the plugin
vim.g.pear_tree_smart_openers = 1
vim.g.pear_tree_smart_closers = 1
vim.g.pear_tree_smart_backspace = 1
vim.g.pear_tree_ft_disabled = { 'TelescopePrompt', 'NvimTree' }


-- CamelCaseMotion
--
vim.g.camelcasemotion_key = '<localleader>'

-- Telescope
--
require('telescope').setup()
require('telescope').load_extension('fzf')
require('telescope').load_extension('ag')

vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<F3>', function() require('telescope.builtin').find_files() end)

vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<F5>', function() require('telescope.builtin').live_grep() end)

vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>l', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<F4>', function() require('telescope.builtin').buffers() end)

vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
vim.keymap.set('n', '<F1>', function() require('telescope.builtin').help_tags() end)

-- Neoclip
--
require('neoclip').setup({
    history = 100,
    enable_persistent_history = true,
    continuous_sync = true,
    keys = {
        telescope = {
            i = {
                paste = '<c-b>',
            }
        }
    }
})

vim.keymap.set('n', '<leader>fcy', function() require('neoclip').clear_history() end)

vim.keymap.set('n', '<leader>fy', function() require('telescope').extensions.neoclip.default() end)
vim.keymap.set('n', '<leader>y', function() require('telescope').extensions.neoclip.default() end)
vim.keymap.set('n', '<F6>', function() require('telescope').extensions.neoclip.default() end)

-- TreeSitter
--
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "python", "lua", "rust", "javascript", "typescript", "html", "bash", "glsl"},
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
}

-- Startify
--
-- Turn off the cow
vim.g.startify_custom_header = ""

-- Colorizer
--
require'colorizer'.setup({'*';}, {RRGGBBAA = true;})

-- Lualine
--
require'lualine'.setup {options = {theme = 'sonokai'}}

-- Sonokai
--
vim.g.sonokai_style = 'default'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_transparent_background = 1

vim.cmd [[colorscheme sonokai]]
