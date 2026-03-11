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

local diff_colors = {
  add = { fg = "#d4d4d4", bg = "#144620" },
  delete = { fg = "#ffffff", bg = "#600000" },
  change = { fg = "#d4d4d4", bg = "#264f78" },
  text = { fg = "#ffffff", bg = "#1f6feb", bold = true },
}

local function apply_diff_colors()
  -- normal diff
  vim.api.nvim_set_hl(0, "DiffAdd", diff_colors.add)
  vim.api.nvim_set_hl(0, "DiffDelete", diff_colors.delete)
  vim.api.nvim_set_hl(0, "DiffChange", diff_colors.change)
  vim.api.nvim_set_hl(0, "DiffText", diff_colors.text)

  -- neogit diff
  vim.api.nvim_set_hl(0, "NeogitDiffAdd", diff_colors.add)
  vim.api.nvim_set_hl(0, "NeogitDiffDelete", diff_colors.delete)
  vim.api.nvim_set_hl(0, "NeogitDiffContext", { fg = "#d4d4d4" })

  vim.api.nvim_set_hl(0, "NeogitHunkHeader", {
    fg = "#9cdcfe",
    bg = diff_colors.change.bg,
    bold = true,
  })
end

apply_diff_colors()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_diff_colors,
})

vim.opt.diffopt:append "algorithm:histogram"
vim.opt.diffopt:append "linematch:60"

vim.o.updatetime = 250

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
      source = true,
    })
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
