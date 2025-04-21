MiniDeps.add({ source = 'rose-pine/neovim', })

MiniDeps.now(function()
  vim.cmd('colorscheme rose-pine-moon')
end)
