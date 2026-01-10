-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "ts_ls",
  "clangd",
  "phpactor",
  "astro",
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
  "tilt_ls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- -- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
--
local util = require "lspconfig.util"

lspconfig.astro.setup {
  -- keep normal project root detection (apps/site)
  root_dir = util.root_pattern("astro.config.mjs", "package.json"),

  on_new_config = function(config, root_dir)
    local git_root = util.find_git_ancestor(root_dir) or root_dir
    local tsdk = util.path.join(git_root, "node_modules", "typescript", "lib")

    config.init_options = config.init_options or {}
    config.init_options.typescript = config.init_options.typescript or {}
    config.init_options.typescript.tsdk = tsdk
  end,
}

lspconfig.tilt_ls.setup {
  filetypes = { "tiltfile" },
  root_dir = lspconfig.util.root_pattern("Tiltfile", ".git"),
}
