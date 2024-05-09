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
    ft = {"python", "typescript", "javascript"},
    opts = function ()
      return require("custom.configs.none-ls")
    end
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function ()
      require("custom.configs.diffview")
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false
  },
}

return plugins
