local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    init = function()
      require("core.utils").load_mappings "coderunner"
    end,
    config = true,
    cmd = { "RunCode", "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype" },
  },

  { "habamax/vim-godot", ft = "gdscript" },
  { "lervag/vimtex", ft = "tex" },

  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
  },

  {
    "TimUntersberger/neogit",
    init = function()
      require("core.utils").load_mappings "neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    cmd = "Neogit",
  },

  {
    "simrat39/symbols-outline.nvim",
    init = function()
      require("core.utils").load_mappings "SymbolsOutline"
    end,
    dependencies = "nvim-lspconfig",
    config = function(_)
      require "plugins.configs.symbols_outline"
    end,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
  },

  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require "codewindow"
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
    event = "VeryLazy",
  },

  {
    "cappyzawa/trim.nvim",
    init = function()
      require("trim").setup {}
    end,
    event = "VeryLazy",
  },

  {
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
  },

  {
    "vimwiki/vimwiki",
    event = "InsertEnter",
    ft = "wiki",
  },

  {
    "sakhnik/nvim-gdb",
    event = "VeryLazy",
    ft = {"c", "cpp"},
  },

  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function(_)
      require("symbol-usage").setup {
        vt_position = "end_of_line",
      }
      require("core.utils").load_mappings "SymbolsUsage"
    end,
  },

  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "andweeb/presence.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require "plugins.configs.nvim_presence"
    end,
  },

  {
    "susensio/magic-bang.nvim",
    config= function()
      require "plugins.configs.magic_bang"
    end,
    event = "BufNewFile",
    cmd = "Bang",
  },

  {
   "sotte/presenting.vim",
    event = "VeryLazy",
    cmd = "StartPresenting",
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "VeryLazy",
    ft = {"c", "cpp", "python", "sh"},
    config = function()
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup({
        preview = {
          win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
          },
        },
      })
    end,
  }


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
