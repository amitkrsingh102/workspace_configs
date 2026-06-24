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

-- CSV table view
map("n", "<leader>cv", "<cmd>CsvViewToggle<CR>", { desc = "Toggle CSV table view" })

-- diagnostics navigation
map("n", "]d", function()
  vim.diagnostic.jump { count = 1 }
end, { desc = "Next diagnostic" })

map("n", "[d", function()
  vim.diagnostic.jump { count = -1 }
end, { desc = "Previous diagnostic" })

-- errors only
map("n", "]e", function()
  vim.diagnostic.jump {
    count = 1,
    severity = vim.diagnostic.severity.ERROR,
  }
end, { desc = "Next error" })

map("n", "[e", function()
  vim.diagnostic.jump {
    count = -1,
    severity = vim.diagnostic.severity.ERROR,
  }
end, { desc = "Previous error" })

-- warnings only
map("n", "]w", function()
  vim.diagnostic.jump {
    count = 1,
    severity = vim.diagnostic.severity.WARN,
  }
end, { desc = "Next warning" })

map("n", "[w", function()
  vim.diagnostic.jump {
    count = -1,
    severity = vim.diagnostic.severity.WARN,
  }
end, { desc = "Previous warning" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Claude Code
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  callback = function()
    map("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { desc = "Add file to Claude", buffer = true })
  end,
})
