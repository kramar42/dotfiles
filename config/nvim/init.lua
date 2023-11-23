---@diagnostic disable: undefined-global
--
-- options
--
vim.diagnostic.config({ virtual_text = true })
vim.opt.colorcolumn = "0"
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.wrap = false
--
-- keymap
--
vim.g.mapleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-n>", ":bn<CR>")
vim.keymap.set("n", "<C-p>", ":bp<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<CR>", ":nohl<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", ":so<CR>", { silent = true })
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>W", ":w !sudo tee % > /dev/null<CR>")
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")
vim.keymap.set("n", "<leader>cn", ":cn<CR>")
vim.keymap.set("n", "<leader>cp", ":cp<CR>")
vim.keymap.set("n", "<leader>d", ":bd!<CR>")
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", ":bn<CR>:bd#<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>m", ":make<CR>")
vim.keymap.set("n", "<leader>q", ":qall!<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":xa<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, ":", ";")
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
-- FIXME
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--
-- load lazy
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--
-- load plugins
--
require("lazy").setup({
  -- undo
  --
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle }
    },
    config = function()
      vim.opt.backup = false
      vim.opt.swapfile = false
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
      vim.opt.undofile = true
    end
  },
  -- git
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", ":LazyGit<CR>" }
    }
  },
  -- telescope
  --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
          file_browser = {
            hijack_netrw = true,
            mappings = {
              ["i"] = {},
              ["n"] = {},
            },
          },
        }
      }
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>g", function()
        builtin.grep_string({ search = vim.fn.input("Grep> ") })
      end)
      vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>e", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = "~/.dotfiles/config/nvim" })
      end)
      vim.keymap.set("n", "<leader>b", builtin.buffers, {})
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  -- colorscheme
  --
  {
    "christianchiarulli/nvcode-color-schemes.vim",
    config = function()
      vim.cmd.colorscheme("xoria")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
    keys = {
      { "<leader>zz", function()
        require("zen-mode").setup {
          window = {
            width = 160,
            options = {}
          },
        }
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end },
      { "<leader>ZZ", function()
        require("zen-mode").setup {
          window = {
            width = 160,
            options = {}
          },
        }
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end }
    }
  },
  -- syntax
  --
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  -- lsp
  --
  {
    "VonHeikemen/lsp-zero.nvim",
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          lsp.default_setup,
        },
      })

      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-BackSpace>"] = cmp.mapping.complete(),
      })
      cmp_mappings["<Tab>"] = nil
      cmp_mappings["<S-Tab>"] = nil

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = "E",
          warn  = "W",
          hint  = "H",
          info  = "I"
        }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      lsp.setup()
    end,
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- TODO do i need *all* of this?

      -- Autocompletion
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  }
})

