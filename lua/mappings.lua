require "nvchad.mappings"

local map = vim.keymap.set
local remove = vim.api.nvim_set_keymap

-- Mappings

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action() <CR>", { desc = "LSP code action" })

-- Remove Mappings

remove("n","<Up>","<Nop>",{noremap = true})
remove("n","<Down>","<Nop>",{noremap = true})
remove("n","<Left>","<Nop>",{noremap = true})
remove("n","<Right>","<Nop>",{noremap = true})


remove("i","<Up>","<Nop>",{noremap = true})
remove("i","<Down>","<Nop>",{noremap = true})
remove("i","<Left>","<Nop>",{noremap = true})
remove("i","<Right>","<Nop>",{noremap = true})

remove("v","<Up>","<Nop>",{noremap = true})
remove("v","<Down>","<Nop>",{noremap = true})
remove("v","<Left>","<Nop>",{noremap = true})
remove("v","<Right>","<Nop>",{noremap = true})
