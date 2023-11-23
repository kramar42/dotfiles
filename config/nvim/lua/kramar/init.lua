
require('kramar.set')
require('kramar.remap')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- nvim setup for init.lua and plugin development
  'folke/neodev.nvim',
  -- undo
  'mbbill/undotree',
  -- git
  'tpope/vim-fugitive',
  -- telescope
  {
	  'nvim-telescope/telescope.nvim',
	  dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  -- colorscheme
  {
	  'christianchiarulli/nvcode-color-schemes.vim',
	  config = function()
		  vim.cmd.colorscheme('xoria')
		  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
		  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
	  end,
  },
  'folke/zen-mode.nvim',
  -- syntax
  {
	  'nvim-treesitter/nvim-treesitter',
	  config = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  },
  'nvim-treesitter/nvim-treesitter-context',
  -- lsp
  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/nvim-cmp'},
		  {'saadparwaiz1/cmp_luasnip'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  },
})

