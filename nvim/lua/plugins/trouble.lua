return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>xx",
			function()
				require("trouble").toggle()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			desc = "Buffer diagnostics",
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle("loclist")
			end,
			desc = "Location list",
		},
		{
			"<leader>xq",
			function()
				require("trouble").toggle("quickfix")
			end,
			desc = "Quickfix list",
		},
	},
	opts = {},
}
