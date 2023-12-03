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
vim.opt.mouse = "nvic"
vim.opt.updatetime = 50
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cmdheight = 0
--
-- cursorline highlighting control
--
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")
--
-- keymap
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<cmd>!t<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>cn<cr>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cp<cr>zz")
vim.keymap.set("n", "<C-n>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<cr>", ":nohl<cr>", { silent = true })
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>W", ":w !sudo tee % > /dev/null<cr>")
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr>:pwd<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>bn<cr>:bd#<cr>")
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, ":", ";")
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
--
-- icons
--
local icons = {
  diagnostics = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
  },
  git = {
    added = "",
    changed = "",
    deleted = "",
  },
}
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
  "folke/neodev.nvim",
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
      { "<leader>gg", ":LazyGit<cr>" },
      { "<leader>gf", ":LazyGitFilterCurrentFile<cr>" },
      { "<leader>ge", ":LazyGitFilter<cr>" },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
      --- @type Gitsigns.Config
      local C = {
        signs = {
          add = { text = icons.git.added },
          change = { text = icons.git.changed },
          delete = { text = icons.git.deleted },
          topdelete = { text = icons.git.deleted },
          changedelete = { text = icons.git.changed },
          untracked = { text = icons.git.added },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          map("n", "]g", gs.next_hunk, "Next Hunk")
          map("n", "[g", gs.prev_hunk, "Prev Hunk")
          map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<cr>", "Stage Hunk")
          map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", "Reset Hunk")
          map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, "Blame Line")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>", "GitSigns Select Hunk")
        end,
      }
      return C
    end,
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
            theme = "ivy",
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
      -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>s", function()
        builtin.grep_string({ search = vim.fn.input("> ") })
      end)
      vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>e", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = "~/code/dotfiles/" })
      end)
      vim.api.nvim_set_keymap("n", "<space>ff", ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
        { noremap = true }
      )
      vim.keymap.set("n", "<leader>h", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>b", builtin.buffers, {})
      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
      end)
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && " ..
        "cmake --build build --config Release && " ..
        "cmake --install build --prefix build",
  },
  -- colorscheme
  --
  {
    "christianchiarulli/nvcode-color-schemes.vim",
    config = function()
      vim.cmd.colorscheme("onedark")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  "HiPhish/rainbow-delimiters.nvim",
  "nvim-tree/nvim-web-devicons",
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
  "yuttie/comfortable-motion.vim",
  {
    "wfxr/minimap.vim",
    config = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
    keys = {
      { "<leader>\\", "<cmd>MinimapToggle<cr>" },
    },
  },
  -- syntax
  --
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- require("nvim-jtreesitter.install").update({ with_sync = true })()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
  -- commenting
  --
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
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
          -- TODO this does not work?
          error = icons.diagnostics.error,
          warn  = icons.diagnostics.warn,
          hint  = icons.diagnostics.hint,
          info  = icons.diagnostics.info,
        }
      })

      ---@diagnostic disable-next-line: unused-local
      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>m", "<cmd>Telescope lsp_document_symbols<cr>")
        vim.keymap.set("n", "<leader>@", "<cmd>Telescope lsp_references<cr>")
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ri", function() vim.lsp.buf.incoming_calls() end, opts)
        vim.keymap.set("n", "<leader>ro", function() vim.lsp.buf.outgoing_calls() end, opts)
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
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Opt to list sources here, when available in mason.
        },
        automatic_installation = false,
        handlers = {},
      })
      require("null-ls").setup({
        sources = {
          -- Anything not supported by mason.
        }
      })
    end,
  },
  -- clojure
  --
  {
    "Olical/conjure",
    ft = { "clojure" },
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end,
      },
    },
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
  },
  {
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup({
        indent = {
          enabled = true,
        },
      })
    end
  },

})
