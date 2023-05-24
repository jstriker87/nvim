-- Set runtimepath and packpath
vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/lua'
vim.o.packpath = vim.o.runtimepath

-- Load Vim-Plug
vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')

-- Specify the plugins you want to install
vim.cmd [[
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/seoul256.vim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-orgmode/orgmode'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-orgmode/orgmode'
]]

vim.fn['plug#end']()

-- Set options
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.mouse = 'a'
vim.o.hlsearch = true
vim.cmd('syntax on')
vim.cmd('colorscheme seoul256')
vim.o.clipboard = 'unnamedplus'
-- Define key mappings
vim.api.nvim_set_keymap('n', '<Left>', ':echo ""<CR>', {})
vim.api.nvim_set_keymap('v', '<Left>', ':<C-u>echo ""<CR>', {})
vim.api.nvim_set_keymap('i', '<Left>', '<C-o>:echo ""<CR>', {})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('n', '<Right>', ':echo ""<CR>', {})
vim.api.nvim_set_keymap('v', '<Right>', ':<C-u>echo ""<CR>', {})
vim.api.nvim_set_keymap('i', '<Right>', '<C-o>:echo ""<CR>', {})
vim.api.nvim_set_keymap('n', '<Up>', ':echo ""<CR>', {})
vim.api.nvim_set_keymap('v', '<Up>', ':<C-u>echo ""<CR>', {})
vim.api.nvim_set_keymap('i', '<Up>', '<C-o>:echo ""<CR>', {})
vim.api.nvim_set_keymap('n', '<Down>', ':echo ""<CR>', {})
vim.api.nvim_set_keymap('v', '<Down>', ':<C-u>echo ""<CR>', {})
vim.api.nvim_set_keymap('i', '<Down>', '<C-o>:echo ""<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {})

-- Lualine configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Telescope configuration
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

-- Load the FZF extension for Telescope
require('telescope').load_extension('fzf')

require('orgmode').setup_ts_grammar()


