local plugins = {
  {
    "williamboman/mason.nvim",
    dots = {
      ensure_installed = {
        "pyright"
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  }
}

return plugins
