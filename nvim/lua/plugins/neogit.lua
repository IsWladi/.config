return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",

		-- Only one of these is needed.
		"folke/snacks.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "[Neogit] Open Neogit" },
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "[Diffview] Open Diffview" },
		{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "[Diffview] Close Diffview" },
	},
	config = function()
		require("neogit").setup({
			disable_line_numbers = false,
			disable_relative_line_numbers = false,
			mappings = {
				status = {
					["1"] = false,
					["2"] = false,
					["3"] = false,
					["4"] = false,
					["<leader>g0"] = "Depth1", -- colapsar todo
				},
			},
		})
	end,
}
