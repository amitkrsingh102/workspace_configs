require "nvchad.autocmds"

local function fix_neogit_hl()
  vim.api.nvim_set_hl(0, "NeogitDiffDelete", { fg = "#ffb3b3", bg = "#600000" })
  vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#ffb3b3", bg = "#600000" })
  vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { fg = "#ffb3b3", bg = "#600000" })
  vim.api.nvim_set_hl(0, "NeogitDiffAdd", { fg = "#d4d4d4", bg = "#144620" })
  vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#d4d4d4", bg = "#144620" })
  vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { fg = "#d4d4d4", bg = "#144620" })
  vim.api.nvim_set_hl(0, "NeogitDiffContext", { fg = "#d4d4d4", bg = "#1e1e1e" })
  vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { fg = "#d4d4d4", bg = "#1e1e1e" })
  vim.api.nvim_set_hl(0, "NeogitDiffContextCursor", { fg = "#d4d4d4", bg = "#1e1e1e" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.schedule(fix_neogit_hl)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "Neogit*",
  callback = function()
    vim.schedule(fix_neogit_hl)
  end,
})
