require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- DISABLED MAPPINGS --
-- TODO: Remove unused mappings
-- local nomap = vim.keymap.del
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

-- Add groups to which-key
local wk = require("which-key")
wk.add({
  { "<leader>l", group = "LSP" },
  { "<leader>f", group = "Find" },
  { "<leader>r", group = "CompetiTest" },
  { "<leader>s", group = "Swap" },
  { "<leader>w", group = "Workspace" },
})
