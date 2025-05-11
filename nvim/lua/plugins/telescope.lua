return {
  -- Para buscar archivos con fzf y rg de manera rapida
  {'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
       },

    config = function()
      --telescope
      telescope = require('telescope')
      telescope.setup({
        pickers = {
          live_grep = {
            prompt_title = "🔎 Live Grep 🔎",
            prompt_prefix= "👀 ",
          },
          find_files = {
            prompt_title = "🔎 Find Files 🔎",
            prompt_prefix= "👀 ",
            find_command = {
              "rg",
              "--hidden",
              "--files",
              "-g",
              "!**/node_modules/*",
              "-g",
              "!**/.git/*",
            },
          },
        }
      })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<CR>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<CR><Space>', builtin.buffers, {desc = '[telescope] Show currents buffers'})
      vim.keymap.set('n', '<CR>f', builtin.find_files, {desc = '[telescope] Show currents buffers'})
      vim.keymap.set('n', '<CR>fg', builtin.live_grep, {desc = '[telescope] Show currents buffers'})
      vim.api.nvim_set_keymap('v', '<CR>', ':lua require("telescope.builtin").grep_string({ use_regex = true })<CR>', { noremap = true, silent = true })

      --treesiter
      vim.keymap.set('n', '<CR>ft', builtin.treesitter, {desc = '[TREESITTER telescope] list var, params and functions with treesiter'})

      --git
      vim.keymap.set('n', '<CR>b', builtin.git_branches, {desc = '[GIT telescope] Make branch actions'})
      vim.keymap.set('n', '<CR>gs', builtin.git_status, {desc = '[GIT telescope] List git status'})
      vim.keymap.set('n', '<CR>gcb', builtin.git_bcommits, {desc = '[GIT telescope] List git commits'})
      vim.keymap.set('n', '<CR>gc', builtin.git_commits, {desc = '[GIT telescope] List all git commits'})
    end,
  },
}

