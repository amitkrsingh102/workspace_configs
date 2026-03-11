-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_dark",

  hl_override = {
    -- Standard diff colors
    DiffAdd = { fg = "#d4d4d4", bg = "#144620" },
    DiffDelete = { fg = "#ffb3b3", bg = "#600000" },
    DiffChange = { fg = "#d4d4d4", bg = "#264f78" },
    DiffText = { fg = "#ffffff", bg = "#1f6feb", bold = true },

    -- Neogit diff
    NeogitDiffAdd = { fg = "#d4d4d4", bg = "#144620" },
    NeogitDiffDelete = { fg = "#ffb3b3", bg = "#600000" },
    NeogitDiffContext = { fg = "#d4d4d4", bg = "#1e1e1e" },
    NeogitDiffAddHighlight = { fg = "#d4d4d4", bg = "#144620" },
    NeogitDiffDeleteHighlight = { fg = "#ffb3b3", bg = "#600000" },
    NeogitDiffContextHighlight = { fg = "#d4d4d4", bg = "#1e1e1e" },

    -- diff syntax groups
    diffAdded = { fg = "#b5cea8" },
    diffRemoved = { fg = "#ffb3b3" },
    diffRemovedSign = { fg = "#ffb3b3" },
    diffChanged = { fg = "#9cdcfe" },

    -- treesitter diff groups
    ["@diff.plus"] = { fg = "#b5cea8" },
    ["@diff.minus"] = { fg = "#ffb3b3" },
    ["@diff.delta"] = { fg = "#9cdcfe" },

    -- Hunk header
    NeogitHunkHeader = {
      fg = "#9cdcfe",
      bg = "#264f78",
      bold = true,
    },

    -- GitSigns gutter
    GitSignsAdd = { fg = "#587c0c" },
    GitSignsDelete = { fg = "#c74e39" },
    GitSignsChange = { fg = "#0c7d9d" },
  },
}
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
