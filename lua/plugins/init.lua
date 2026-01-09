return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      vim.g.rust_recommended_style = true
      vim.g.rustaceanvim = {
        tools = {
          enable_clippy = true,
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { enable = true, command = "clippy" },
              diagnostics = { enable = true },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              checkOnSaveAllTargets = true,
              check = { command = "check" },
            },
          },
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup {
            -- Fixes the "NotifyBackground" warning
            background_colour = "#000000", -- or a hex like "#1e1e2e"
          }
          vim.notify = require "notify"
        end,
      },
    },
    opts = {
      routes = {
        {
          view = "mini",
          filter = {
            event = "msg_showmode",
          },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = true, -- use classic bottom cmdline for search
        command_palette = true, -- command line and popupmenu together
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup {
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        hint_enable = false,
        floating_window = true,
        floating_window_off_x = 1,
        floating_window_off_y = 0,
        padding = "",
      }
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,

    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" } },
      { "<leader>dr", "<cmd> DapContinue <CR>", { desc = " Start or continue debugger" } },
    },

    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require "dap"
    end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "configs.none-ls"
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvimtools/none-ls-extras.nvim",
  --   },
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        ignore = false,
      },
      filters = {
        dotfiles = false,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "stylua",
        -- "haskell-language-server",
        "bash-language-server",
        "lua-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "c",
        "rust",
        -- "haskell",
        "python",
        "lua",
      },
    },
  },
}
