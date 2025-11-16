return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"anuvyklack/hydra.nvim",
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio",
	},
	-- keys = { { "<leader>d"}},

	config = function()
		require("wladi.dap")
		dap, dapui = require("dap"), require("dapui")

		vim.keymap.set("n", "<F1>", dapui.toggle, { desc = "Debug: See last session result." })

		-- dap python config
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		-- dap java config

		dap.configurations.java = {
			{
				name = "Debug Attach 5005",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 5005,
				-- mainClass = "com.iswladi.apimedmath.apimedmath.ApimedmathApplication",
			},
			{
				name = "Debug Attach (8000)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 8000,
			},
			{
				name = "Run current Java file",
				type = "java",
				request = "launch",
				cwd = "${fileDirname}",
				console = "integratedTerminal",
				vmArgs = "-Xmx2g",
			},
		}
	end,
}
