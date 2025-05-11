return {
  -- Para marcar archivos y navegar entre ellos de manera rapida, se complementa bien con gittory.
  {'ThePrimeagen/harpoon',
    lazy = true,
    keys = {
      {"<Space>ha"},
      {"<Space>hm"},
      {"<Space>r"},
      {"<Space>t"},
      {"<Space>n"},
      {"<Space>s"}
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<Space>ha", mark.add_file, {desc = '[harpoon] Add file to mark'})
      vim.keymap.set("n", "<Space>hm", ui.toggle_quick_menu, {desc = '[harpoon] Toggle quick menu'})
      vim.keymap.set("n", "<Space>r", function() ui.nav_file(1) end, {desc = '[harpoon] Navigate to file 1'})
      vim.keymap.set("n", "<Space>t", function() ui.nav_file(2) end, {desc = '[harpoon] Navigate to file 2'})
      vim.keymap.set("n", "<Space>n", function() ui.nav_file(3) end, {desc = '[harpoon] Navigate to file 3'})
      vim.keymap.set("n", "<Space>s", function() ui.nav_file(4) end, {desc = '[harpoon] Navigate to file 4'})
    end,
  },
}
