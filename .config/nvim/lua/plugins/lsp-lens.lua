---@type NvPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  config = function()
    require("lsp-lens").setup({
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = false,
        references = true,
        implements = false,
        git_authors = true,
      },
    })
  end,
}
