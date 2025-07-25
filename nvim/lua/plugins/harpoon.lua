return {
	-- Para marcar archivos y navegar entre ellos de manera rapida, se complementa bien con gittory.
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<Space>ha" },
			{ "<Space>hm" },
			{ "<Space>r" },
			{ "<Space>t" },
			{ "<Space>n" },
			{ "<Space>s" },
		},
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<Space>ha", function()
				harpoon:list():add()
			end)

			vim.keymap.set("n", "<Space>hm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<Space>r", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<Space>t", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<Space>n", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<Space>s", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
