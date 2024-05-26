local M = {}

M.setup = function()
  require('render-markdown').setup({
    -- Characters that will replace the # at the start of markdown headings
    headings = { '#', '##', '###', '####', '#####', '######' },
    -- Character to use for the bullet point in lists
    bullet = '○',
    highlights = {
      heading = {
        -- Used for rendering heading line backgrounds
        backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete' },
        -- Used for rendering the foreground of the heading character only
        foregrounds = {
          'markdownH1',
          'markdownH2',
          'markdownH3',
          'markdownH4',
          'markdownH5',
          'markdownH6',
        },
      },
      -- Used when displaying code blocks
      code = 'ColorColumn',
      -- Used when displaying bullet points in list
      bullet = 'Normal',
      table = {
        -- Used when displaying header in a markdown table
        head = '@markup.heading',
        -- Used when displaying non header rows in a markdown table
        row = 'Normal',
      },
    },
  })
end

M.config = function()
end

return M
