---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      "bash",
      "lua",
      "luadoc",
      "markdown",
      "printf",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "json",
      "javascript",
      "typescript",
      "tsx",
    },

    auto_install = true,

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
}
