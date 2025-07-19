return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	config = function()
		-- setup each of the snacks modules
		local Snacks = require("snacks")
		Snacks.setup({
			picker = { enabled = true },
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			image = { enabled = true },
			dim = { enabled = true },
			scroll = { enabled = true },
		})

		-- Dim toggle
		local dim_enabled = false

		vim.api.nvim_create_user_command("Dim", function()
			if dim_enabled then
				require("snacks").dim.disable()
			else
				require("snacks").dim.enable()
			end
			dim_enabled = not dim_enabled
		end, {})
	end,

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
