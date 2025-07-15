-- lazy.nvim
---@type NvPluginSpec
return {
  "GustavEikaas/easy-dotnet.nvim",
  --NOTE: Nvchad has telescope not FzfLua
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  ft = { "cs", "csproj", "sln", "slnx", "props", "csx", "targets" },
  cmd = "Dotnet",
  config = function()
    require("easy-dotnet").setup()
  end,
}
