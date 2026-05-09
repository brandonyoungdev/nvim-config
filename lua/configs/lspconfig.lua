require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.config("*", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})

vim.lsp.enable {
  "html",
  "ts_ls",
  "clangd",
  "phpactor",
  "gopls",
  "pyright",
  "yamlls",
  "dockerls",
  "tailwindcss",
  "intelephense",
  "psalm",
  "rust_analyzer",
  "vhdl_ls",
  "bacon_ls",
}

-- astro: locate typescript SDK relative to the git root of the workspace
vim.lsp.config("astro", {
  root_markers = { "astro.config.mjs", "package.json" },
  before_init = function(params, config)
    local root = (params.workspaceFolders or {})[1]
    root = root and vim.uri_to_fname(root.uri) or vim.fn.getcwd()
    local path = root
    while path ~= "/" do
      if vim.uv.fs_stat(path .. "/.git") then
        root = path
        break
      end
      path = vim.fn.fnamemodify(path, ":h")
    end
    config.init_options = vim.tbl_deep_extend("force", config.init_options or {}, {
      typescript = { tsdk = root .. "/node_modules/typescript/lib" },
    })
  end,
})
vim.lsp.enable "astro"

vim.lsp.config("tilt_ls", {
  filetypes = { "tiltfile" },
  root_markers = { "Tiltfile", ".git" },
})
vim.lsp.enable "tilt_ls"
