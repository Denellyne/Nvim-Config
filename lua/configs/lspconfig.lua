require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "lua_ls", "bashls" }
vim.lsp.enable(servers)

vim.lsp["rust-analyzer"] = function() end
vim.lsp.config.clangd = {

  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git",
  },
}

-- read :h vim.lsp.config for changing options of lsp servers
