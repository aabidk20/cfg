---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("import")
  end,
}
