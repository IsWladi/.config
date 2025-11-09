return {
	--lsp para autocompletado
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP Support
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			require("mason").setup()

			local mlsp = require("mason-lspconfig")

			local servers = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"tailwindcss",
				"jsonls",
				"dockerls",
				"yamlls",
				"html",
				"rust_analyzer",
				"jdtls",
			}

			mlsp.setup({
				ensure_installed = servers,
				automatic_enable = { exclude = { "jdtls" } },
			})

			local caps = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = caps,
			})

			-- on_attach + keymaps ------------
			local function my_on_attach(_, bufnr)
				local hover = "[LSP] Hover"
				local diagnostic = "[LSP] Diagnostic"
				local definition = "[LSP] Definition"
				local type_definition = "[LSP] Type Definition"
				local implementation = "[LSP] Implementation"
				local rename = "[LSP] Rename"
				local code_action = "[LSP] Code Action"

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, { buffer = bufnr, remap = false, desc = hover })
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { buffer = bufnr, remap = false, desc = definition })
				vim.keymap.set("n", "gt", function()
					vim.lsp.buf.type_definition()
				end, { buffer = bufnr, remap = false, desc = type_definition })
				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.implementation()
				end, { buffer = bufnr, remap = false, desc = implementation })
				vim.keymap.set("n", "<CR>e", function()
					vim.diagnostic.goto_next()
				end, { buffer = bufnr, remap = false, desc = diagnostic })
				vim.keymap.set("n", "<CR>r", function()
					vim.lsp.buf.rename()
				end, { buffer = bufnr, remap = false, desc = rename })
				vim.keymap.set("n", "<CR>ca", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, remap = false, desc = code_action })
			end

			vim.api.nvim_create_autocmd("LspAttach", {

				callback = function(args)
					my_on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
				end,
			})

			-- overrides
			vim.lsp.config("lua_ls", {
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			vim.lsp.config("tailwindcss", {
				filetypes = { "css" },
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = { error = "E", warn = "W", hint = "H", info = "I" },
				},
			})
		end,
	},
}
