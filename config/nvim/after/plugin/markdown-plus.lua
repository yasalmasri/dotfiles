MiniDeps.add({
  source = 'yousefhadder/markdown-plus.nvim',
})

MiniDeps.now(function()
  require('markdown-plus').setup({
    -- Configuration options (all optional)
    enabled = true,
    features = {
      list_management = true,      -- List management features
      text_formatting = true,      -- Text formatting features
      thematic_break = true,       -- Thematic break insert/cycle
      headers_toc = true,          -- Headers + TOC features
      links = true,                -- Link management features
      images = true,               -- Image link management features
      quotes = true,               -- Blockquote toggling feature
      callouts = true,             -- GFM callouts/admonitions feature
      code_block = true,           -- Fenced code block workflows
      html_block_awareness = true, -- Skip operations inside HTML blocks
      table = true,                -- Table support features
      footnotes = true,            -- Footnotes management features
    },
    footnotes = {        -- Footnotes configuration
      section_header = "Footnotes",  -- Header for footnotes section
      confirm_delete = true,         -- Confirm before deleting footnotes
    },
    keymaps = {
      enabled = true,  -- Enable default keymaps (<Plug> available for custom)
    },
    toc = {            -- TOC window configuration
      initial_depth = 2,
    },
    callouts = {       -- Callouts configuration
      default_type = "NOTE",
      custom_types = {},  -- Add custom types like { "DANGER", "SUCCESS" }
    },
    table = {          -- Table sub-configuration
      auto_format = true,
      default_alignment = "left",
      confirm_destructive = true,  -- Confirm before transpose/sort operations
      keymaps = {
        enabled = true,
        prefix = "<localleader>t",
        insert_mode_navigation = true,  -- Alt+hjkl cell navigation
      },
    },
    filetypes = { "markdown" },  -- Filetypes to enable the plugin for
  })
end)
