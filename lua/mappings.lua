require "nvchad.mappings"
local map = vim.keymap.set

map("n", "<leader>q", function()
  local file = vim.fn.expand "%"
  local output = vim.fn.expand "%:r"
  vim.cmd "w"
  vim.cmd("split | terminal clang++ -std=c++20 -Wall -Wextra " .. file .. " -o " .. output .. " && ./" .. output)
end, { desc = "Compile & run C++ (clang++)" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
