local M = {}

M.general = {
  n = {
    ["<C-g>"] = { "<C-w>h", "Window left custom"}
  }
}

M.nvterm = {
  t = {
    ["<Esc>"] = {[[<C-\><C-n>]], "Nvterm Normal Mode"}
  }
}

return M

