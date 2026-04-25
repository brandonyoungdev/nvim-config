local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "biome" },
    html = { "prettier" },
    go = { "gofmt", "goimports", "gci" },
    php = { "pint" },
    yaml = { "prettierd" },
    blade = { "blade-formatter " },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    tsx = { "biome" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
