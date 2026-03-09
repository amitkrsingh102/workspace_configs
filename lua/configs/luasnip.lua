local ls = require("luasnip")

-- Load snippets from lua/snippets
require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
})

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})
