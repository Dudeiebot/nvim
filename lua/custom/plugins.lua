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
        "tinymist",
        "mypy",
        "ruff-lsp",
        "delve",
        "typescript-language-server",
        "eslint-lsp",
        "eslint_d",
        "prettier"
      },
    },
  },

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
    "leoluz/nvim-dap-go",
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

  --formatters
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
  {
    "supermaven-inc/supermaven-nvim",
    event = { "InsertEnter" },
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-q>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        disable_inline_completion = false,
        disable_keymaps = false, 
      })
    end,
  },
    {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufReadPost',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {},
    config = function()
      require('typst-preview').setup({})
      vim.keymap.set('n', '<leader>tp', ':TypstPreview<CR>', { buffer = true, desc = 'Typst Preview' })
    end,
  },
{
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

  local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
  end,
  keys = {
    { "<leader>A", function() require("harpoon"):list():add() end, desc = "harpoon file" },
    { "<leader>a", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu" },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4" },
  },
}
}
return plugins

-- {
--   "ThePrimeagen/harpoon",
--   branch = "harpoon2",
--   dependencies = { 
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--   },
--   config = function()
--     local harpoon = require("harpoon")
--     harpoon:setup()
--
--     -- Load the telescope extension
--     require("telescope").load_extension("harpoon")
--   end,
--   keys = {
--     { "<leader>A", function() require("harpoon"):list():append() end, desc = "harpoon file" },
--     { "<leader>a", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu" },
--     { "<leader>h", ":Telescope harpoon marks<CR>", desc = "harpoon telescope" },
--     { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1" },
--     { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2" },
--     { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3" },
--     { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4" },
--   },
-- }
