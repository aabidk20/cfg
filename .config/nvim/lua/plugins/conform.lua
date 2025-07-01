---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      markdown = { "prettierd" },
      sql = { "sqlfmt" },
      python = { "ruff_format" },
      sh = { "shfmt" },
      templ = { "templ" },
      go = { "goimports", "gofmt" },
      html = { "prettierd" },
      php = { "pint" },
      blade = { "prettierd" },
    },

    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  },
}
