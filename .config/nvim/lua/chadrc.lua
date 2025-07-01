-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tundra",

  theme_toggle = {
    "tundra",
    "tundra",
  },
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#181825",
      },
    },
    github_dark = {
      base_16 = {
        base0A = "white",
      },
    },
    tundra = {
      base_16 = {
        base00 = "#181825",
      },
    },
  },
  integrations = {
    "render-markdown",
  },
}

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
