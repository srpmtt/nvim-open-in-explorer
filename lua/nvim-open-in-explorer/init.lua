local M = {}

function M.open()
  local bufname = vim.fn.bufname("%")
  local dir = vim.fn.fnamemodify(bufname, ":h")
  local os_name = vim.loop.os_uname().sysname

  if os_name == "Windows_NT" then
    vim.fn.system({ 'explorer.exe', dir })
  elseif os_name == "Darwin" then
    vim.fn.system({ 'open', dir })
  elseif os_name == "Linux" then
    local win_dir = vim.fn.system('wslpath -w ' .. dir)
    vim.fn.system({ 'explorer.exe', win_dir })
  else
    vim.fn.system({ 'xdg-open', dir })
  end
end

vim.cmd('command! -range OpenInExplorer lua require("nvim-open-in-explorer").open()')

return M
