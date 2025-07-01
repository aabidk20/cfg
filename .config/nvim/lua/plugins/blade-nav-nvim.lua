---@type NvPluginSpec
return {
  "ricardoramirezr/blade-nav.nvim",
  enabled = false,
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  ft = { "blade", "php" },
  opts = {
    close_tag_on_complete = false, -- default: true
  },
}
