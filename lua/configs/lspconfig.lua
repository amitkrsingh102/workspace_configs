require("nvchad.configs.lspconfig").defaults()

local servers = { "ts_ls", "tailwindcss", "html", "cssls", "jsonls", "eslint", "clangd" }
vim.lsp.enable(servers)

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
