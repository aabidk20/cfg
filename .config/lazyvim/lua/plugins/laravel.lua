return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>La", ":Laravel artisan<cr>" },
    { "<leader>Lr", ":Laravel routes<cr>" },
    { "<leader>Lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {
    features = {
      pickers = {
        enable = true,
        provider = "fzf-lua",
      },
    },
  },
  config = true,
}
