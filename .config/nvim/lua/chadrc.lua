-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine-dawn",

  theme_toggle = {
    "rosepine-dawn",
    "rosepine",
  },
}

M.base46.hl_override = require("hl")[M.base46.theme]

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
  cmp = {
    format_colors = {
      tailwind = true,
    },
  },
}

M.term = {
  winopts = {
    winfixbuf = true,
  },
}

return M
