local M = {}

function M.disable_rtns_mappings()
  pcall(vim.api.nvim_del_keymap, 'v', 'r')
  pcall(vim.api.nvim_del_keymap, 'v', 't')
  pcall(vim.api.nvim_del_keymap, 'v', 'n')
  pcall(vim.api.nvim_del_keymap, 'v', 's')

end

function M.enable_rtns_mappings()
  vim.api.nvim_set_keymap('v', 'r', '<Left>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 't', '<Down>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'n', '<Up>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 's', '<Right>', { noremap = true, silent = true })
end

return M
