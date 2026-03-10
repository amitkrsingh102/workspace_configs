require "nvchad.options"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor styles
vim.opt.guicursor = table.concat({
  "n-v-c:block-blinkwait300-blinkon200-blinkoff150", -- normal/visual/command
  "i-ci:ver25-blinkwait300-blinkon200-blinkoff150", -- insert
  "r-cr:hor20-blinkwait300-blinkon200-blinkoff150", -- replace
  "o:hor50", -- operator pending
}, ",")

-- Highlight current line
vim.opt.cursorline = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
