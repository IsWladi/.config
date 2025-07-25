return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"vimdoc",
					"javascript",
					"python",
					"lua",
					"luadoc",
					"html",
					"yaml",
					"json",
					"markdown",
					"regex",
					"java",
					"csv",
					"rust",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = false,

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",

							["af"] = "@function.outer",
							["if"] = "@function.inner",

							["al"] = "@loop.outer",
							["il"] = "@loop.inner",

							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
				},
			})
		end,
	},
}

--doc

--incremental_selection: Este módulo te permite seleccionar partes del código de manera incremental.
--
--init_selection: Este atajo de teclado inicia la selección incremental en la posición actual del cursor. En este caso, se asigna a <c-space>.
--node_incremental: Este atajo de teclado aumenta la selección al siguiente nivel. En este caso, se asigna a <c-space>.
--scope_incremental: Este atajo de teclado aumenta la selección al siguiente nivel de ámbito. En este caso, se asigna a <c-s>.
--node_decremental: Este atajo de teclado disminuye la selección al nivel anterior. En este caso, se asigna a <M-space>.

--textobjects.select: Este módulo te permite seleccionar objetos de texto específicos en tu código.
--
--af: Selecciona la función que está alrededor del cursor.
--if: Selecciona la función que está dentro del cursor.
--ac: Selecciona la clase que está alrededor del cursor.
--ic: Selecciona la clase que está dentro del cursor.

--textobjects.move: Este módulo te permite moverte entre objetos de texto específicos en tu código.
--
--goto_next_start: Mueve el cursor al inicio del siguiente objeto de texto.
--]m: Mueve el cursor al inicio de la siguiente función.
--]]: Mueve el cursor al inicio de la siguiente clase.
--goto_previous_start: Mueve el cursor al inicio del objeto de texto anterior.
--[m: Mueve el cursor al inicio de la función anterior.
-- [[: Mueve el cursor al inicio de la clase anterior.
