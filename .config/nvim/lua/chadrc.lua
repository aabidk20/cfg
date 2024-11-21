-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- theme_toggle = {
  --   "catppuccin",
  --   "github_light",
  -- },
}

M.base46.hl_override = require("hl")[M.base46.theme]

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

return M
