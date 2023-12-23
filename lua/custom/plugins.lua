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
      require("symbols-outline").setup {
        position = "left",
      }
    end,
    dependencies = "nvim-lspconfig",
    config = function(_)
      require("core.utils").load_mappings "SymbolsOutline"
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
    event = "VeryLazy",
    config = function()
      require("presence").setup {
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text = "The Superior Text Editor!", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = true, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer

        -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        editing_text        = "Editing some file...",
        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        file_explorer_text  = "Browsing some directory...",
        -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        git_commit_text     = "Committing changes...",
        -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        plugin_manager_text = "Managing plugins...",
         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        reading_text        = "Reading some file...",
        -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        workspace_text      = "Working on %s",
        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        line_number_text    = "Line %s out of %s",
      }
    end,
  },

  {
    "susensio/magic-bang.nvim",
    config= function()
      require("magic-bang").setup({
        {
          bins = {
            awk = "awk",
            hs = "runhaskell",
            jl = "julia",
            lua = "lua",
            m = "octave",
            mak = "make",
            php = "php",
            pl = "perl",
            py = "python3",
            r = "Rscript",
            rb = "ruby",
            scala = "scala",
            sh = "bash",
            tcl = "tclsh",
            tk = "wish",
          },
          automatic = true,         -- insert shebang on new file when in $PATH
          command = true,           -- define Bang user command
          executable = true,        -- make file executable on exit
          default = "/bin/bash"     -- default shebang for `:Bang` without args
        }
      })
    end,
    event = "BufNewFile",
    cmd = "Bang",
  },

  {
   "sotte/presenting.vim",
    event = "VeryLazy",
    cmd = "StartPresenting",
  },

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
