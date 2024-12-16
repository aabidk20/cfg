---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    -- extensions_list = { "themes", "terms", "fzf" },
    -- defaults = {
    --   borderchars = {
    --     prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
    --     results = { " ", " ", " ", " ", " ", " ", " ", " " },
    --     preview = { " ", " ", " ", " ", " ", " ", " ", " " },
    --   },
    -- },
  },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("import")
  end,
}
