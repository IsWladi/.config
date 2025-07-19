return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		image = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<CR>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<CR>g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<CR>k",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<CR>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<CR>w",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
	},
}
