--We get the mapping done here and get thing going
local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd>DapToggleBreakpoint<CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets')
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar"
    }
  }
}

-- Debugging Go
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd>GoTagAdd json<CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd>GoTagAdd yaml<CR>",
      "Add yaml struct tags"
    }
  }
}

M.undotree = {
  plugin = true,
  n = {
    ["<leader>fu"] = {
      "<cmd>UndotreeToggle<CR>",
      "Toggle undotree"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Debug python test method"
    }
  }
}

return M
