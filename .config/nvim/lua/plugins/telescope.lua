---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    -- require("telescope").load_extension("fzf")
    -- require("telescope").load_extension("import")
    -- require("telescope").load_extension("live_grep_args")

    telescope.setup({
      live_grep_args = {
        mappings = {
          i = {
            ["<C-'>"] = lga_actions.quote_prompt(),
            ["<C-space>"] = lga_actions.to_fuzzy_refine,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("import")
    telescope.load_extension("live_grep_args")
  end,
}
