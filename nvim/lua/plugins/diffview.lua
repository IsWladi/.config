return{
{'sindrets/diffview.nvim',
  keys = {
    {'<leader>v'},
    {'<leader>vc'}
  },
  config = function()
    vim.keymap.set('n', '<leader>v', ':DiffviewOpen<CR>', {desc = '[Diffview] Open Diffview'})
    vim.keymap.set('n', '<leader>vc', ':DiffviewClose<CR>', {desc = '[Diffview] Close Diffview'})
  end
}
}

