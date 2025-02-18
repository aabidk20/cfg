---@type NvPluginSpec
return {
  "andrewferrier/debugprint.nvim",
  enabled = true,
  -- opts = {},
  version = "*",
  event = "BufRead",
  opts = {
    keymaps = {
      normal = {
        plain_below = "g?p",
        plain_above = "g?P",
        variable_below = "g?v",
        variable_above = "g?V",
      },
    },
  },
}
