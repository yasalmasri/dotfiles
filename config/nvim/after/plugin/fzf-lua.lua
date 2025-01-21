MiniDeps.add({ source = 'ibhagwan/fzf-lua', })
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>")
