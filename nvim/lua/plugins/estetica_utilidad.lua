return{
  --identacion
  {'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup()
    end,
	},

  --Plug para ver que lineas tienen cambios en git
  {'mhinz/vim-signify'},

  --diseño barrita de abajo
  {'vim-airline/vim-airline'},

  --pestañas
  {'ap/vim-buftabline'},

  --depends on plugin(in case of)
  {'nvim-lua/plenary.nvim', lazy = true},

  --icons
  {'nvim-tree/nvim-web-devicons'},
}
