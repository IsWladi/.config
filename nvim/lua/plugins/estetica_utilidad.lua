return {

	--identacion
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},

	--Plug para ver que lineas tienen cambios en git
	{ "mhinz/vim-signify" },

	--diseño barrita de abajo
	{ "vim-airline/vim-airline" },

	--pestañas
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- colores verdaderos requeridos por las highlights de bufferline
			vim.opt.termguicolors = true

			-- muestra siempre la línea (aunque haya un solo buffer)
			vim.opt.showtabline = 2 -- 0 nunca · 1 solo si ≥2 · 2 siempre

			require("bufferline").setup({
				options = {
					mode = "buffers", -- "tabs" si prefieres tabpages
					diagnostics = "nvim_lsp", -- iconos de errores/avisos
					separator_style = "thin",
				},
			})
		end,
	},

	--depends on plugin(in case of)
	{ "nvim-lua/plenary.nvim", lazy = true },

	--icons
	{ "nvim-tree/nvim-web-devicons" },
}
