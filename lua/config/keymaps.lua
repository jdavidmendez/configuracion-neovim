-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
-- terminal

--Move to window using the movement keys
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

--ToggleTerm map
vim.keymap.set("n", "<leader>1", "<cmd>1ToggleTerm<cr>", { desc = "ToggleTerm 1" })
vim.keymap.set("n", "<leader>2", "<cmd>2ToggleTerm<cr>", { desc = "ToggleTerm 2" })
vim.keymap.set("n", "<leader>3", "<cmd>3ToggleTerm<cr>", { desc = "ToggleTerm 3" })
vim.keymap.set("n", "<leader>4", "<cmd>4ToggleTerm<cr>", { desc = "ToggleTerm 4" })
vim.keymap.set("n", "<leader>5", "<cmd>5ToggleTerm<cr>", { desc = "ToggleTerm 5" })
