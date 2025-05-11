vim.cmd([[
  augroup WrapSettings
    autocmd!
    autocmd BufReadPost * lua require('wrap').set_wrap()
  augroup END
]])

local M = {}

function M.set_wrap()
  if (vim.fn.expand("%:t") == "keymap.c") or (vim.fn.expand("%:e") == "md") then
    vim.wo.wrap = false
  else
    vim.wo.wrap = true
  end
end

return M
