-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

-- Color adjustments for NeoTree

-- Dark separators
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1a1b26", bg = "#1a1b26" })
-- vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1a1b26", bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#1a1b26" })

--Lighter separators
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b4261", bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#3b4261", bg = "#1a1b26" })
