local plugins = {
  {
    "williamboman/mason.nvim",
    dots = {
      ensure_installed = {
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
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require("custom.configs.none-ls")
    end
  },
}

return plugins
