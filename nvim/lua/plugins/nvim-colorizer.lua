return {
  {"NvChad/nvim-colorizer.lua",
    ft = {"css", "javascript", "html"},
    config = function()
      require 'colorizer'.setup {
        filetypes = {
          'css',
          'javascript',
          'html',
        },
      }
    end,
  }
}
