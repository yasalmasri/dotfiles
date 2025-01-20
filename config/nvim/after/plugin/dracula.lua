MiniDeps.add({ source = 'Mofiqul/dracula.nvim', })

MiniDeps.now(function()
  vim.cmd('colorscheme dracula-soft')
end)
