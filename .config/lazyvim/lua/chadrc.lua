local M = {}

M.base46 = {
  theme = "tundra",

  theme_toggle = {
    "github_light",
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
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

return M
