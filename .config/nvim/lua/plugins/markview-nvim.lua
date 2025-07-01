---@type NvPluginSpec
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  enabled = false,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preview = {
      modes = { "n", "c" },
      hybrid_modes = { "n" },

      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          -- This will prevent Tree-sitter concealment being disabled on the cmdline mode
          vim.wo[win].concealcursor = "c"
        end,
      },
    },
  },
}
