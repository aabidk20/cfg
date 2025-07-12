-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tw = require("treewalker")
local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Treewalker keymaps
map("n", "<A-j>", tw.move_down, { noremap = true })
map("n", "<A-k>", tw.move_up, { noremap = true })
map("n", "<A-h>", tw.move_out, { noremap = true })
map("n", "<A-l>", tw.move_in, { noremap = true })

-- In insert mode, insert -> on <A-l> and => on <A-L>
map("i", "<A-l>", "->")
map("i", "<A-L>", "=>")

--remove default mapping for leader + l
del("n", "<leader>l")
map({ "n", "v" }, "<leader><leader>", "<Cmd>w<CR>", { desc = "Save" })

map("n", "<leader>ld", "<Cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", { desc = "Show diagnostics" })
map("n", "<leader>lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
map("n", "<leader>lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })

map("n", "<leader>L", "<Cmd>Laravel<CR>", { desc = "Laravel" })

-- Toggle inlay hints
map(
  "n",
  "<leader>li",
  "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), nil)<CR>",
  { desc = "Toggle inlay hints" }
)
