--all our custom plugins are added here
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go", --these is not debugging, so i have to work on it 
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end
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
    end
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
}
return plugins
