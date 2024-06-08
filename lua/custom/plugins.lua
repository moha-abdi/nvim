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
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
    ft = {"python", "typescript", "javascript", "sh", "bash", "zsh", "go"},
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
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd('echo "Running build"')
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },
}

return plugins
