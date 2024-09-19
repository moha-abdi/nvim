local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require "lspconfig/util"
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeautures = true,
      }
    },
  },
})

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.jsx"},
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
}

lspconfig.prismals.setup {
  cmd = {"prisma-language-server", "--stdio"},
  filetypes = {"prisma"},
  settings = {
    prisma = {
      prismaFmtBinPath = "", -- Optional: specify the path to `prisma-fmt` binary if needed
    },
  },
  on_attach = on_attach,
  capabilities = capabilities
}
