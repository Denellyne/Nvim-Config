require "nvchad.autocmds"

-- Folds
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    -- Safely check if a parser is installed and can be loaded for this buffer
    local has_parser = lang and pcall(vim.treesitter.get_parser, buf, lang)

    if has_parser then
      -- use treesitter folding (must be local to the buffer!)
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    else
      -- use alternative foldmethod (must be local to the buffer!)
      vim.opt_local.foldmethod = "syntax"
    end
  end,
})
