--- @type NvPluginSpec
return {
  enabled = true,
  auto_refresh = false,
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    filetypes = { yaml = true, markdown = true },
    suggestion = {
      enable = true,
      auto_trigger = true,
      keymap = {
        accept = "<M-f>",
        --- <M-l> conflicts with tmux bindings
      },
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
