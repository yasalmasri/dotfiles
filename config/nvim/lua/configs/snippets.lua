local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- local date = function() return {os.date('%Y-%m-%d')} end
--
-- ls.add_snippets(nil, {
--     all = {
--         snip({
--             trig = "date",
--             namr = "Date",
--             dscr = "Date in the form of YYYY-MM-DD",
--         }, {
--             func(date, {}),
--         }),
--     },
-- })

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "vjsx",
      namr = "Vuejs template",
      dscr = "Compolete Vuejs template",
    }, {
        text({ "<template>" }),
        text({ "", "\t<div>" }),
        text({ "", "\t</div>" }),
        text({ "", "</template>", "" }),

        text({ "", "<script>" }),
        text({ "", "export default {" }),
        text({ "", "\tname: \"$0\",", "" }),
        text({ "", "\tdata () {" }),
        text({ "", "\t\treturn {" }),
        text({ "", "\t\t}" }),
        text({ "", "\t},", "" }),
        text({ "", "\tprops: {" }),
        text({ "", "\t},", "" }),
        text({ "", "\tcomponents: {" }),
        text({ "", "\t},", "" }),
        text({ "", "\tcomputed: {" }),
        text({ "", "\t},", "" }),
        text({ "", "\tmethods: {" }),
        text({ "", "\t},", "" }),
        text({ "", "\twatch: {" }),
        text({ "", "\t},", "" }),
        text({ "", "\tmounted () {" }),
        text({ "", "\t}" }),
        text({ "", "}" }),
        text({ "", "</script>" }),
      }),
  },
})

ls.filetype_extend("ruby", {"rails"})
ls.filetype_extend("vue", {"html"})

require('luasnip/loaders/from_vscode').lazy_load({ path = { "./snippets" } })
