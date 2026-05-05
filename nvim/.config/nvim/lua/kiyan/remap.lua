vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split window equally" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Split window close" })

