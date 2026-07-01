MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'main',
  -- Perform action after every checkout
  hooks = { post_checkout = function()
    if vim.fn.executable('tree-sitter') == 1 then
      vim.cmd('TSUpdate')
    end
  end },
})

local languages = { 'lua', 'vimdoc', 'ruby', 'http' }

MiniDeps.now(function()
  require('nvim-treesitter').setup()

  if vim.fn.executable('tree-sitter') == 1 then
    require('nvim-treesitter').install(languages)
  end

  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
    pattern = languages,
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end)
