return {
  "sindrets/diffview.nvim",
  enabled = true,
  dependencies = {
    { "lewis6991/gitsigns.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },

  opts = {
    enhanced_diff_hl = true,
  },

  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
}
