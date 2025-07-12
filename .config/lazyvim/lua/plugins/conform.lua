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
      -- templ = { "templ" },
      go = { "goimports", "gofmt" },
      html = { "prettierd" },
      php = { "pint" },
      blade = { "prettierd" },
    },
  },
}
