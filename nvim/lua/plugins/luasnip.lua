return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			--lua snippets
			local ls = require("luasnip")
			local t = ls.text_node
			local i = ls.insert_node
			local s = ls.snippet

			ls.config.set_config({
				history = true,
			})

			require("luasnip.loaders.from_vscode").load_standalone({
				path = "~/.config/nvim/snippets/gitcommit.code-snippets",
			})
			require("luasnip.loaders.from_vscode").lazy_load()

			-- is my expansion key
			vim.keymap.set({ "i", "s" }, "<C-e>", function()
				if ls.expand_or_jumpable(1) then
					ls.expand_or_jump(1)
				end
			end, { silent = true, desc = "[snippets] go to next" })

			-- is my jump forward keymap
			vim.keymap.set({ "i", "s" }, "<C-o>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true, desc = "[snippets] go to previus" })
		end,
	},
}
