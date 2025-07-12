return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        dockerls = {},
        sqlls = {},
        yamlls = {},
        jsonls = {},
        clangd = {},
        html = {
          filetypes = { "html", "blade" },
        },
        -- TODO: for typescript, LazyVim also includes extra specs to properly setup lspconfig,
        -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
        -- { import = "lazyvim.plugins.extras.lang.typescript" },
        ts_ls = {
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
        },
        emmet_language_server = {
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
        },
        pyright = {
          filetypes = { "python" },
        },
        lua_ls = {},
        tailwindcss = {
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
        },
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        htmx = {
          filetypes = { "html" },
        },
        phpactor = {
          filetypes = { "php", "blade" },
          -- root_dir = function(_) return vim.fn.getcwd() end,
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
            ["language_server_worse_reflection.inlay_hints.enable"] = true,
            ["language_server_worse_reflection.inlay_hints.types"] = true,
          },
        },
        astro = {
          init_options = {
            typescript = {
              tsdk = "/home/USER/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib/",
            },
          },
        },
      },
    },
  },
}
