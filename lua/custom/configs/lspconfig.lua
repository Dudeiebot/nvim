local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- util is no longer needed as we use native root_markers

local function organize_imports()
  local param = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(param)
end

-- Gopls configuration
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable("gopls")

-- Python configurations (Pyright and Ruff)
local python_servers = {
  "pyright",
  "ruff",
}

for _, lsp in ipairs(python_servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  })
  vim.lsp.enable(lsp)
end

-- Typescript/Javascript configuration
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
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
})
vim.lsp.enable("ts_ls")

-- Tinymist (Typst) configuration
vim.lsp.config("tinymist", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"tinymist"},
  filetypes = {"typst"},
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable"
  }
})
vim.lsp.enable("tinymist")

-- Rust Analyzer configuration
vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = {"rust"},
  root_markers = { "Cargo.toml", "rust-project.json" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")
