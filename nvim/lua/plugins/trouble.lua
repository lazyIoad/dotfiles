return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>X",
			function()
				require("trouble").close()
			end,
			desc = "Close",
		},
		{
			"<leader>xx",
			function()
				require("trouble").toggle()
			end,
			desc = "Open",
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
