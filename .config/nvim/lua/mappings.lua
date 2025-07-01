require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- DISABLED MAPPINGS --
-- nomap("n", "<A-h>")
-- nomap("n", "<A-l>")
--
--
-- CompetiTest mappings
map("n", "<F5>", "<Cmd>CompetiTest run<CR>", { desc = "Run CompetiTest" })
--- No mapping, just a placeholder for the CompetiTest mappings
-- map("n", "<leader>r", "<Cmd>echo 'CompetiTest mappings'", { desc = "CompetiTest" })
map("n", "<leader>rs", "<Cmd>CompetiTest show_ui<CR>", { desc = "Show CompetiTest UI" })
map("n", "<leader>rp", "<Cmd>CompetiTest receive problem<CR>", { desc = "Receive problem" })
map("n", "<leader>rc", "<Cmd>CompetiTest receive contest<CR>", { desc = "Receive contest" })
map("n", "<leader>rt", "<Cmd>CompetiTest receive testcases<CR>", { desc = "Receive testcases" })
map("n", "<leader>ra", "<Cmd>CompetiTest add_testcase<CR>", { desc = "Add testcase" })
map("n", "<leader>re", "<Cmd>CompetiTest edit_testcase<CR>", { desc = "Edit testcase" })
map("n", "<leader>rd", "<Cmd>CompetiTest delete_testcase<CR>", { desc = "Delete testcase" })

--- Telescope mappings
-- map("n", "<leader>f", "<Cmd>echo 'Find'", { desc = "Find" })
map("n", "<leader>fi", "<Cmd>Telescope import<CR>", { desc = "Find imports" })

-- Show errors
-- map("n", "<leader>l", "<Cmd>echo 'LSP'", { desc = "LSP" })
map("n", "<leader>ld", "<Cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", { desc = "Show diagnostics" })
map("n", "<leader>lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
map("n", "<leader>lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })

-- Toggle inlay hints
map(
  "n",
  "<leader>li",
  "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), nil)<CR>",
  { desc = "Toggle inlay hints" }
)

-- Remap f/F for leap.nvim
-- TODO: Flow not good
-- vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
-- vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')

-- TreeWalker mappings
local tw = require("treewalker")
map("n", "<A-j>", tw.move_down, { noremap = true })
map("n", "<A-k>", tw.move_up, { noremap = true })
map("n", "<A-h>", tw.move_out, { noremap = true })
map("n", "<A-l>", tw.move_in, { noremap = true })

-- Misc
map("n", "yc", "yygccp", { desc = "Comment and Copy current line" })
-- moving lines/blocks in visual mode with indenting.
--TODO: Replace with insert mode and Alt key bindings
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- Saving files
map({ "n", "v" }, "<leader><leader>", "<Cmd>w<CR>", { desc = "Save" })

-- In insert mode, insert -> on <A-l> and => on <A-L>
map("i", "<A-l>", "->")
map("i", "<A-L>", "=>")

-- Laravel mappings
-- Override 'gf' for laravel [Disabled for blade-nav plugin for now]
-- map("n", "gf", function()
--   if require("laravel").app("gf").cursor_on_resource() then
--     return "<cmd>Laravel gf<CR>"
--   else
--     return "gf"
--   end
-- end, { noremap = true, expr = true })

-- Leader L for :Laravel
map("n", "<leader>L", "<Cmd>Laravel<CR>", { desc = "Laravel" })

--- Telescope live grep args
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- WRT to the above example, you can add the following to your custom functions file: for log:
map(
  "n",
  "<leader>A",
  "<Cmd>lua require('custom.logging').quick_log()<CR>",
  { desc = "Open daily log in floating window" }
)

-- Add groups to which-key
local wk = require("which-key")
wk.add({
  { "<leader>l", group = "LSP" },
  { "<leader>f", group = "Find" },
  { "<leader>r", group = "CompetiTest" },
  { "<leader>s", group = "Swap" },
  { "<leader>w", group = "Workspace" },
})
