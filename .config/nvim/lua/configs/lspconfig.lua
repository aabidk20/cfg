-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

-- Setup for go-template-lsp
-- local function start_go_template_lsp()
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = "html",
--     callback = function(args)
--       vim.lsp.start({
--         name = "go-tmpl-lsp",
--         cmd = { "go-template-lsp" },
--         capabilities = capabilities,
--         -- root_dir = vim.fn.getcwd(),
--         root_dir = vim.fs.root(args.buf, { "go.mod" }),
--       })
--     end,
--   })
-- end
--
-- start_go_template_lsp()

-- EXAMPLE
local default_servers = {
  "cssls",
  "dockerls",
  "sqlls",
  "yamlls",
  "jsonls",
  "clangd",
  -- "ltex",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

lspconfig.html.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html", "blade" },
})

lspconfig.ts_ls.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = "non-relative",
    },
  },
})

lspconfig.emmet_language_server.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
    "blade",
  },
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      -- https://github.com/LuaLS/lua-language-server/wiki/Settings#hint
      hint = {
        enable = true,
        arrayIndex = "Auto",
        paramName = "All",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "blade",
    "astro",
  },
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
})

lspconfig.htmx.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html" },
})

lspconfig.markdown_oxide.setup({
  -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
  -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  }),
  on_attach = on_attach, -- configure your on attach config
  on_init = on_init,
})

lspconfig.phpactor.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = function(_)
    return vim.fn.getcwd()
  end,
  filetypes = { "php", "blade" },
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
    ["language_server_worse_reflection.inlay_hints.enable"] = true,
    ["language_server_worse_reflection.inlay_hints.types"] = true,
  },
})

-- Astro server
lspconfig.astro.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = "/home/aabid/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib/",
    },
  },
})
