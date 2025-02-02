local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>tg"] = {
      "<cmd> Telescope live_grep <CR>",
      "Search files inside project",
    },

    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M
