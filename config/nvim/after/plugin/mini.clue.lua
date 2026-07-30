MiniDeps.add('echasnovski/mini.clue')

require('mini.clue').setup({
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    { mode = 'n', keys = '<LocalLeader>' },
    { mode = 'x', keys = '<LocalLeader>' },
  },
})
