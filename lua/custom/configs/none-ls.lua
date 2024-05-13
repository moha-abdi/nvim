local null_ls = require("null-ls")
local au_group = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
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
