local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require ("lspconfig")
local util = require "lspconfig/util"

local function organize_imports()
  local param = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(param)
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

local servers = {
  "pyright",
  "ruff",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
})
end

-- nvim-lsp config (:help lspconfig-all)
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
    command = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports"
      }
    }
  }

lspconfig.tinymist.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"tinymist"},
  filetypes = {"typst"},
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable"
  }
}
