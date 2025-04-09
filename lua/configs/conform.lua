local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofmt", "goimports", "gci" },
    php = { "pint" },
    yaml = { "prettierd" },
    blade = { "blade-formatter " },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    tsx = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
