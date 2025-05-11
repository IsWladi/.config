return {
  {'mbbill/undotree',
    enabled = true,
    keys = {
      {"<leader>u"}
    },
    config = function()
      vim.keymap.set('n', '<leader>u', function ()
              vim.g.undotree_SetFocusWhenToggle = 1
              vim.cmd.UndotreeToggle()
      end)
    end,
  },
}
