return {
  {"tpope/vim-fugitive",
    enabled = true,
    lazy = true,
    keys = {
      {"<leader>gg"},
      {"<leader>gf"},
      {"<leader>gl"},
      {"<leader>gp"},
      {"<leader>gs"},
      {"<leader>gb"},
      {"<leader>gd"},
      {"<leader>gr"}
    },
  config = function()
  vim.keymap.set("n", "<leader>gg" , ":Git<cr>", {desc               = '[GIT] Open Git'})
  vim.keymap.set("n", "<leader>gf", ":Git fetch --all -p<cr>", {desc = '[GIT] Fetch all and prune from Git'})
  vim.keymap.set("n", "<leader>gl", ":Git pull<cr>", {desc           = '[GIT] Pull from Git'})
  vim.keymap.set("n", "<leader>gp", ":Git push<cr>", {desc           = '[GIT] Push to Git'})
  vim.keymap.set("n", "<leader>gs" , ":Git status<cr>", {desc        = '[GIT] Open Git status'})
  vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", {desc          = '[GIT] Open Git blame'})
  vim.keymap.set("n", "<leader>gd", ":Git diff<cr>", {desc           = '[GIT] View Git diff'})
  vim.keymap.set("n", "<leader>gr", ":Git reflog<cr>", {desc         = '[GIT] Open Git reflog'})
  end,
  },
}
