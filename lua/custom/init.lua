-- Function to setup shell configurations for PowerShell on Windows
function SetupPowerShell()
  -- Set shell based on availability of pwsh 
  -- falling back to powershell if it doesn't exist
  if vim.fn.executable('pwsh') == 1 then
    vim.api.nvim_command('autocmd VimEnter * let &shell = "pwsh -NoLogo"')
  else
    vim.api.nvim_command('autocmd VimEnter * let &shell = "powershell -NoLogo"')
  end

  -- Set shell command flags
  vim.api.nvim_command([[
    autocmd VimEnter * let &shellcmdflag = '-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
  ]])

  -- Set shell redirection
  vim.api.nvim_command('autocmd VimEnter * let &shellredir = "2>&1 | % { \\"$_\\" } | Out-File %s; exit $LastExitCode"')

  -- Set shell piping
  vim.api.nvim_command('autocmd VimEnter * let &shellpipe = "2>&1 | % { \\"$_\\" } | Tee-Object %s; exit $LastExitCode"')

  -- Set shell quote options
  vim.api.nvim_command('autocmd VimEnter * set shellquote=')
  vim.api.nvim_command('autocmd VimEnter * set shellxquote=')
end

-- Conditionally setup PowerShell if on Windows
if vim.fn.has('win32') == 1 then
  SetupPowerShell()
end

