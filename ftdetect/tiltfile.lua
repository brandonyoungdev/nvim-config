vim.filetype.add {
  filename = {
    ["Tiltfile"] = "tiltfile",
  },
}

vim.treesitter.language.register("starlark", "tiltfile")
