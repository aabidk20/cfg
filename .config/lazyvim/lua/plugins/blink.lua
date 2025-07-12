return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "saghen/blink.compat",
      lazy = true,
      opts = {},
    },
  },
  opts = function()
    local ui = require("nvconfig").ui.cmp
    local atom_styled = ui.style == "atom" or ui.style == "atom_colored"

    local menu_cols
    if atom_styled or ui.icons_left then
      menu_cols = { { "kind_icon" }, { "label" }, { "kind" } }
    else
      menu_cols = { { "label" }, { "kind_icon" }, { "kind" } }
    end

    local components = {
      kind_icon = {
        text = function(ctx)
          local icons = require("nvchad.icons.lspkind")
          local icon = (icons[ctx.kind] or "󰈚")
          if atom_styled then
            icon = " " .. icon .. " "
          end
          return icon
        end,
      },
      kind = {
        highlight = function(ctx)
          return atom_styled and "comment" or ctx.kind
        end,
      },
    }

    local menu = {
      scrollbar = false,
      border = atom_styled and "none" or "single",
      draw = {
        padding = { atom_styled and 0 or 1, 1 },
        columns = menu_cols,
        components = components,
      },
    }

    return {
      -- snippets = { preset = "luasnip" },
      -- cmdline = { enabled = true },
      -- appearance = { nerd_font_variant = "normal" },
      -- fuzzy = { implementation = "prefer_rust" },
      sources = {
        default = { "laravel", "lsp", "snippets", "buffer", "path" },
        providers = {
          laravel = {
            name = "laravel",
            module = "blink.compat.source",
            score_offset = 1000,
          },
        },
      },

      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "single" },
        },
        menu = menu,
      },
    }
  end,
}
