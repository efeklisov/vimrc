vim.api.nvim_exec ('language en_US', true)

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
    -- use { 'bkad/CamelCaseMotion' }
    use { 'hrsh7th/cmp-buffer', requires = { 'hrsh7th/nvim-cmp'  } }
    use { 'hrsh7th/cmp-cmdline', requires = {'hrsh7th/nvim-cmp'   } }
    use { 'hrsh7th/cmp-nvim-lsp', requires = { 'hrsh7th/nvim-cmp'  } }
    use { 'hrsh7th/nvim-cmp' }
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim', requires = { 'williamboman/mason.nvim'  } }
    use { 'L3MON4D3/LuaSnip' }

    -- Fanciness
    use 'mhinz/vim-startify'
    use 'norcalli/nvim-colorizer.lua'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'sainnhe/sonokai', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'tanvirtin/monokai.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'sainnhe/everforest', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'projekt0n/github-nvim-theme', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'folke/tokyonight.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'catppuccin/nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'sainnhe/gruvbox-material', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'sainnhe/edge', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'bluz71/vim-nightfly-guicolors', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'dracula/vim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'mhartington/oceanic-next', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'fenetikm/falcon', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'shaunsingh/nord.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'marko-cerovac/material.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'rebelot/kanagawa.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'EdenEast/nightfox.nvim', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' }, }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

---- Basic configuration

-- Resize START
-- vim.g.gui_font_default_size = 14
-- vim.g.gui_font_size = vim.g.gui_font_default_size
-- vim.g.gui_font_face = "FiraCode NF"

-- RefreshGuiFont = function()
--   vim.o.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
-- end

-- ResizeGuiFont = function(delta)
--   vim.g.gui_font_size = vim.g.gui_font_size + delta
--   if (vim.g.gui_font_size == 13) then 
--       vim.g.gui_font_size = vim.g.gui_font_size + delta
--   end
--   RefreshGuiFont()
-- end

-- ResetGuiFont = function ()
--   vim.g.gui_font_size = vim.g.gui_font_default_size
--   RefreshGuiFont()
-- end

-- Call function on startup to set default value
-- ResetGuiFont()

-- Resize font

-- local opts = { noremap = true, silent = true }

-- vim.keymap.set({'n', 'v', 'c', 'i', 's', 'x', 'o'}, "<A-=>", function() ResizeGuiFont(1)  end, opts)
-- vim.keymap.set({'n', 'v', 'c', 'i', 's', 'x', 'o'}, "<A-->", function() ResizeGuiFont(-1) end, opts)
-- vim.keymap.set({'n', 'v', 'c', 'i', 's', 'x', 'o'}, "<A-BS>", function() ResetGuiFont() end, opts)
-- Resize END

vim.o.termguicolors = true    -- Full color mode
vim.o.showcmd = false      -- Do not show last command
vim.o.showmode = false      -- Do not show mode in cmd
vim.o.splitbelow = true      -- Horizontal splits go downwards
vim.o.splitright = true      -- Vertical splits go to the right
-- vim.o.mouse=a            -- Full-featured mouse
vim.o.mouse = nil                 -- Disabled mouse
vim.o.mousehide = true      -- Hide system cursor after a while
vim.o.expandtab = true      -- Tabs are spaces now
vim.o.shiftwidth = 4      -- Visible width of a tab
vim.o.softtabstop = 4      -- Amount of spaces in a tab
vim.o.number = true               -- Relative line numbers with absolute current #1
vim.o.relativenumber = true    -- Relative line numbers with absolute current #2
vim.o.signcolumn='number'         -- Squash sign and number columns
vim.o.wrap = false                 -- Break lines by words #1
-- vim.o.linebreak = true            -- Break lines by words #2
-- vim.o.list = false            -- Break lines by words #3
vim.o.showtabline = 0      -- Hide buffer list on top
vim.o.cursorline = true      -- Highlight current line
vim.o.ignorecase = true      -- Ignore case when searching
vim.o.smartcase = true      -- Case sensitive search if has uppercase letters
-- vim.o.foldmethod='syntax'    -- Syntax folding
vim.o.foldmethod = 'manual'          -- Manual folding
vim.o.foldnestmax = 10                  -- Maximum folding depth
vim.o.foldlevelstart = 99          -- Open file unfolded, screws with 'zm' (Use zM and zR)
vim.o.foldenable = true                  -- Start unfolded, enable and disable folds by 'zc'
vim.o.conceallevel = 0            -- Do not hide syntax in languages like markdown
-- vim.o.backup = false                 -- Disable backup #1
-- vim.o.writebackup = false            -- Disable backup #2
vim.o.updatetime = 300            -- Shorter update delay
vim.opt_global.shortmess:append("c")    -- Don't pass messages to completion menu
vim.o.laststatus = 3                    -- Unified status line

vim.g.mapleader = '-'       -- Prefix for mappings
vim.g.maplocalleader = '\\'     -- Second prefix for mappings

vim.o.completeopt='menu,menuone,noselect'

vim.filetype.add({ extension = { usf = 'hlsl', ush = 'hlsl', hlsl = 'hlsl', cfx = 'hlsl', cfi = 'hlsl' } })

---- Neovide
vim.g.neovide_confirm_quit = false

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono:h10"
end

---- Basic commands

-- Run terminal command in a split
vim.api.nvim_create_user_command('Term', ':split term://<args>', { nargs = '*' })

---- Basic mappings

-- vim.keymap.set({'n', 'v', 'c', 'i', 's', 'x', 'o'}, '<C-z>', '<Nop>')

vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

vim.keymap.set('n', '<S-Up>', '<C-y><C-y><C-y>')
vim.keymap.set('n', '<S-Down>', '<C-e><C-e><C-e>')

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
vim.keymap.set('n', '<C-c>', '^v$"+y')
-- Your next best bet
vim.keymap.set('v', '<Space>c', '"+y')
vim.keymap.set('n', '<Space>c', '^v$"+y')

-- Paste
vim.keymap.set('i', '<C-v>', '<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>', { silent = true })
vim.keymap.set('n', '<C-v>', ':set paste<CR>"+p:set nopaste<CR>', { silent = true })
vim.keymap.set('c', '<C-v>', '<C-r>+')

-- Select whole text
vim.keymap.set('n', '<Space>a', 'ggVG')

-- Save file
vim.keymap.set('n', '<Space>s', '<CMD>w<CR>')
vim.keymap.set('n', '<C-s>', '<CMD>w<CR>')

-- Edit config
vim.keymap.set('n', '<Space>e', '<CMD>e $MYVIMRC<CR>')
-- Source config
vim.keymap.set('n', '<Space>w', '<CMD>source $MYVIMRC<CR><CMD>echom "config is sourced"<CR>')

-- Open location list
vim.keymap.set('n', '<Space>l', '<CMD>lopen<CR>')

-- Close location list
vim.keymap.set('n', '<Space>q', '<CMD>lclose<CR>')

-- Remove trailing whitespace
vim.keymap.set('n', '<Space>t', '<CMD>let _s=@/ <Bar> <CMD>%s/\\s\\+$//e <Bar> <CMD>let @/=_s <Bar> <CMD>nohl <Bar> <CMD>unlet _s <CR><CMD>echom "whitespace deleted"<CR>')

-- Turn off highlight
vim.keymap.set('n', '<Space>h', '<CMD>noh<CR>', { silent = true })

-- VS Code magic
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

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

 -- vim.api.nvim_create_autocmd('BufRead,BufNewFile', { group = basicname, pattern = '*.usf', command = 'setfiletype hlsl' })

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
vim.keymap.set('n', '<A-2>', '<CMD>NvimTreeToggle<CR>')

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
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<M-->"] = "select_horizontal",
                ["<M-\\>"] = "select_vertical",
                ["<C-v>"] = false,
                ["<C-x>"] = false,
            }
        },
        cache_picker = {
            num_pickers=-1,
            limit_entires=1000
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ag')

vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F3>', function() require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-3>', function() require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.9}}) end)

vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F5>', function() require('telescope.builtin').live_grep({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-5>', function() require('telescope.builtin').live_grep() end)

vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<leader>l', function() require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F4>', function() require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-4>', function() require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.9}}) end)

vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F1>', function() require('telescope.builtin').help_tags({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-1>', function() require('telescope.builtin').help_tags({layout_strategy='vertical', layout_config={width=0.9}}) end)

vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').resume() end)
vim.keymap.set('n', '<F7>', function() require('telescope.builtin').resume() end)
vim.keymap.set('n', '<A-7>', function() require('telescope.builtin').resume() end)

vim.keymap.set('n', '<leader>fp', function() require('telescope.builtin').pickers({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F8>', function() require('telescope.builtin').pickers({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-8>', function() require('telescope.builtin').pickers({layout_strategy='vertical', layout_config={width=0.9}}) end)

vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').colorscheme({enable_preview=true}) end)
vim.keymap.set('n', '<F9>', function() require('telescope.builtin').colorscheme({enable_preview=true}) end)
vim.keymap.set('n', '<A-9>', function() require('telescope.builtin').colorscheme({enable_preview=true}) end)

-- Neoclip
--
require('neoclip').setup({
    history = 100,
    -- enable_persistent_history = true,
    continuous_sync = true,
    -- keys = {
    --     telescope = {
    --         i = {
    --             paste = '<c-b>',
    --         }
    --     }
    -- }
})

vim.keymap.set('n', '<leader>fcy', function() require('neoclip').clear_history({layout_strategy='vertical', layout_config={width=0.9}}) end)

vim.keymap.set('n', '<leader>fy', function() require('telescope').extensions.neoclip.default({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<leader>y', function() require('telescope').extensions.neoclip.default({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<F6>', function() require('telescope').extensions.neoclip.default({layout_strategy='vertical', layout_config={width=0.9}}) end)
vim.keymap.set('n', '<A-6>', function() require('telescope').extensions.neoclip.default({layout_strategy='vertical', layout_config={width=0.9}}) end)

-- TreeSitter
--
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "cmake", "vim", "hlsl", "glsl", "vimdoc", "lua", "rust", "python", "javascript"},
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

-- LSP
--
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local lspopts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', lspopts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', lspopts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', lspopts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', lspopts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', lspopts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', lspopts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', lspopts)
    vim.keymap.set('n', '<S-F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', lspopts)
    vim.keymap.set({'n', 'x'}, '<S-F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', lspopts)
    vim.keymap.set('n', '<S-F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', lspopts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', lspopts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', lspopts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', lspopts)
  end
})

local default_setup = function(server)
  lspconfig[server].setup({})
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
      lspconfig.lua_ls.setup({
          settings = {
              Lua = {
                  diagnostics = {
                      globals = {'vim'},
                  },
              },
          },
      }),
      default_setup,
  },
})

-- CMP
--
local cmp = require'cmp'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                -- if vim.bo.buftype ~= 'prompt' and has_words_before() then
                --     cmp.complete()
                -- else
                    fallback()
                -- end
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                -- if vim.bo.buftype ~= 'prompt' and has_words_before() then
                --     cmp.complete()
                -- else
                    fallback()
                -- end
            end
        end,
    }),
    sources = cmp.config.sources({
        { name = 'buffer' },
        {name = 'nvim_lsp'},
    }),
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    })
})

-- Sonokai
--
vim.g.sonokai_style = 'default'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_transparent_background = 1

-- EverForest
--
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1

-- Monokai
--
-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }
-- require('monokai').setup { palette = require('monokai').ristretto }

vim.cmd [[
    function! s:sonokai_custom() abort
        let l:palette = sonokai#get_palette(g:sonokai_style, {})
        call sonokai#highlight('VertSplit', l:palette.none, l:palette.none)
    endfunction

    colorscheme sonokai 
    call s:sonokai_custom()
]]
