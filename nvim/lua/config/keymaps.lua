-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Jump to start and end of line using the home row keys
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- moving tabs conveniently
vim.keymap.set("n", "<leader>1", "1gt", { desc = "Move to tab 1" })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "Move to tab 2" })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "Move to tab 3" })
vim.keymap.set("n", "<leader>4", "4gt", { desc = "Move to tab 4" })
vim.keymap.set("n", "<leader>5", "5gt", { desc = "Move to tab 5" })

-- Disable arrow keys in normal mode - remove later after muscle memory
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
