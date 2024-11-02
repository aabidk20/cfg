---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      -- https://www.josean.com/posts/nvim-treesitter-and-textobjects
      textobjects = {
        select = {
          enable = true,

          lookahead = true,

          keymaps = {
            ["a="] = "@assignment.outer",
            ["i="] = "@assignment.inner",
            ["af"] = {
              query = "@function.outer",
              desc = "Select outer part of a function",
            },
            ["if"] = {
              query = "@function.inner",
              desc = "Select inner part of a function",
            },
            ["ac"] = {
              query = "@class.outer",
              desc = "Select outer part of a class",
            },
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            ["i,"] = {
              query = "@parameter.inner",
              desc = "Select inner part of a parameter",
            },
            ["a,"] = {
              query = "@parameter.outer",
              desc = "Select outer part of a parameter",
            },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>snp"] = "@parameter.inner",
            ["<leader>snf"] = "@function.outer",
            ["<leader>snc"] = "@class.outer",
          },
          swap_previous = {
            ["<leader>spp"] = "@parameter.inner",
            ["<leader>spf"] = "@function.outer",
            ["<leader>spc"] = "@class.outer",
          },
        },
      },
    })
  end,
}
