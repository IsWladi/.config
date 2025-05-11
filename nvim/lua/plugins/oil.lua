return {
  'stevearc/oil.nvim',
  keys = {"-"},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
  end,
}
