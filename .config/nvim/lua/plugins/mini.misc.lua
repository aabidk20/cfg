---@type NvPluginSpec
return {
  "echasnovski/mini.misc",
  lazy = false,
  -- use the setup_termbg_sync function to set up the termbg sync
  config = function()
    require("mini.misc").setup_termbg_sync()
  end,
}
