---@type NvPluginSpec
return {
  "piersolenski/telescope-import.nvim",
  ft = { "ts", "tsx", "lua", "python" },
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension "import"
  end,
}
