MiniDeps.add('echasnovski/mini.files')
require('mini.files').setup()

vim.keymap.set("n", "<leader>o", ":lua MiniFiles.open()<CR>") -- toggle split window maximization
