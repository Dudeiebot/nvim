--all our custom plugins are added here
local plugins = {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "gopls",
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "delve",
        "typescript-language-server",
        "eslint-lsp",
        "prettier"
      },
    },
  },
  -- look into the debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end
  },
 {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
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
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "leoluz/nvim-dap-go", --these is not debugging, so i have to work on it 
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  --fornatters
  {
    "nvimtools/none-ls.nvim",
    ft = {"go", "python", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
    {
        "<leader>sB",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Browse files",
      },
    },
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },
  {
    "mbbill/undotree",
     cmd = "UndotreeToggle",
     init = function()
      require("core.utils").load_mappings("undotree")
    end
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy"
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy"
  },
  {
    "iamcco/markdown-preview.nvim",
    keys = {
    {
        "<leader>md",
        "<cmd>MarkdownPreview<CR>",
        desc = "MarkdownPreview",
      },
    {
        "<leader>ms",
        "<cmd>MarkdownPreviewStop<CR>",
        desc = "MarkdownPreviewStop",
      },
    {
        "<leader>mt",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "MarkdownPreviewToggle",
      },
    },
     ft = { "markdown" },
     build = function() vim.fn["mkdp#util#install"]()
    end,
  },
}
return plugins
