---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.SymbolsOutline = {
  plugin = true,
  n = {
    ["<space>symot"] = { "<cmd> SymbolsOutline <CR>", "Toggle LSP Symbols Outline", silent = true },
  },
}

M.SymbolsUsage = {

  plugin = true,
  n = {

    ["<space>symut"] = {
      function()
        require("symbol-usage").toggle()
      end,
      "Toggle LSP Symbols Usage",
    },

    ["<space>symur"] = {
      function()
        require("symbol-usage").refresh()
      end,
      "Refresh LSP Symbols Usage",
    },

  },
}

M.nvim_move = {
  plugin = true,
  n = {
    ["<A-j>"] = { "<cmd>MoveLine(1)<CR>", "Move Line Down", silent=true },
    ["<A-k>"] = { "<cmd>MoveLine(-1)<CR>", "Move Line Up", silent=true },
    ["<A-h>"] = { "<cmd>MoveHChar(-1)<CR>", "Move Line Left", silent=true },
    ["<A-l>"] = { "<cmd>MoveHChar(1)<CR>", "Move Line Right", silent=true },
    ["<leader>wf"] = { "<cmd>MoveWord(1)<CR>", "Move Word to the right", silent=true },
    ["<leader>wb"] = { "<cmd>MoveWord(-1)<CR>", "Move Word to the left", silent=true },
  },
  v = {
    ["<A-j>"] = { "<cmd>MoveLine(1)<CR>", "Move Line Down", silent=true },
    ["<A-k>"] = { "<cmd>MoveLine(-1)<CR>", "Move Line Up", silent=true },
    ["<A-h>"] = { "<cmd>MoveHChar(-1)<CR>", "Move Line Left", silent=true },
    ["<A-l>"] = { "<cmd>MoveHChar(1)<CR>", "Move Line Right", silent=true },
  }
}

M.coderunner = {
  plugin = true,
  n = {
    ["<space>rf"] = { "<cmd> RunCode <CR>", "Run File" },
    ["<space>rp"] = { "<cmd> RunProject <CR>", "Run Project" },
  },
}

M.neogit = {
  plugin = true,
  n = {
    ["<space>ng"] = { "<cmd> Neogit cwd=%:p:h <CR>", "Open Neogit", silent = true },
  },
}
return M
