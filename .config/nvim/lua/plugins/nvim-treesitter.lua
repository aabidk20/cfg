---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
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
      "html",
      "php",
      "php_only",
    },

    auto_install = true,

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "v",
        node_decremental = "V",
      },
    },

    indent = { enable = true },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })
  end,
}
