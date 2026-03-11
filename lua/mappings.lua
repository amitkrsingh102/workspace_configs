require "nvchad.mappings"
local map = vim.keymap.set

-- C++ compile & run
map("n", "<leader>q", function()
  local file = vim.fn.expand "%"
  local output = vim.fn.expand "%:r"
  vim.cmd "w"
  vim.cmd("split | terminal clang++ -std=c++20 -Wall -Wextra " .. file .. " -o " .. output .. " && ./" .. output)
end, { desc = "Compile & run C++ (clang++)" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Diffview mappings
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Git diff view" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Close Git diff view" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git file history" })

-- Git UI
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Git UI" })

-- Git blame
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame line" })

map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end)
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end)

map("n", "]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)

map("n", "]w", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end)
map("n", "[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
