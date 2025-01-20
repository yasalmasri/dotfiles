MiniDeps.add('echasnovski/mini.starter')
  local my_items = {
    { name = 'Echo random number', action = 'lua print(math.random())', section = 'Section 1' },
    function()
      return {
        { name = 'Item #1 from function', action = [[echo 'Item #1']], section = 'From function' },
        { name = 'Placeholder (always inactive) item', action = '', section = 'From function' },
        function()
          return {
            name = 'Item #1 from double function',
            action = [[echo 'Double function']],
            section = 'From double function',
          }
        end,
      }
    end,
    { name = [[Another item in 'Section 1']], action = 'lua print(math.random() + 10)', section = 'Section 1' },
  }

  local starter = require('mini.starter')
  starter.setup({
    items = my_items,
    content_hooks = {
      starter.gen_hook.adding_bullet("- "),
      starter.gen_hook.aligning("center", "center")
    },
  })
