local null_ls = require("null-ls")
local au_group = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.shfmt,
    require("none-ls.diagnostics.ruff"),
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    require("none-ls-shellcheck.diagnostics"),
    require("none-ls-shellcheck.code_actions"),
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = au_group,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = au_group,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({bufnr = bufnr})
        end
      })
    end
  end
}
return opts
