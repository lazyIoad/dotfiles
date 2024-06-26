return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			f = { name = "+fzf" },
			l = { name = "+lsp" },
			g = { name = "+git" },
			x = { name = "+trouble" },
			s = { name = "+swap (tree-sitter)" },
			C = { name = "+colorscheme" },
		}, { prefix = "<leader>" })
	end,
}
