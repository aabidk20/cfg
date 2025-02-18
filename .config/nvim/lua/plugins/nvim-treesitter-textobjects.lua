---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      -- https://www.josean.com/posts/nvim-treesitter-and-textobjects
      textobjects = {
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>pf"] = "@function.outer",
            ["<leader>pC"] = "@class.outer",
          },
        },
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
            ["aC"] = {
              query = "@class.outer",
              desc = "Select outer part of a class",
            },
            ["iC"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            ["ia"] = {
              query = "@parameter.inner",
              desc = "Select inner part of a parameter",
            },
            ["aa"] = {
              query = "@parameter.outer",
              desc = "Select outer part of a parameter",
            },
            ["il"] = {
              query = "@loop.inner",
              desc = "Select inner part of a loop",
            },
            ["al"] = {
              query = "@loop.outer",
              desc = "Select outer part of a loop",
            },
            ["ic"] = {
              query = "@conditional.inner",
              desc = "Select inner part of a conditional",
            },
            ["ac"] = {
              query = "@conditional.outer",
              desc = "Select outer part of a conditional",
            },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sna"] = "@parameter.inner",
            ["<leader>snf"] = "@function.outer",
            ["<leader>snc"] = "@class.outer",
          },
          swap_previous = {
            ["<leader>spa"] = "@parameter.inner",
            ["<leader>spf"] = "@function.outer",
            ["<leader>spc"] = "@class.outer",
          },
        },
      },
    })
  end,
}
