local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    c = { "clang-format" },
    cpp = { "clang-format" },

    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },

    javascriptreact = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },

    css = { "prettier" },
    html = { "prettier" },

    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

return options
