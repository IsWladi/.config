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
}
