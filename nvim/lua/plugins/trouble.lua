return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>X",
			function()
				require("trouble").toggle()
			end,
			desc = "(trouble) Toggle",
		},
		{
			"<leader>xx",
			function()
				require("trouble").open()
			end,
			desc = "Open",
		},
		{
			"<leader>xd",
			function()
				require("trouble").open("document_diagnostics")
			end,
			desc = "Buffer diagnostics",
		},
		{
			"<leader>xl",
			function()
				require("trouble").open("loclist")
			end,
			desc = "Location list",
		},
		{
			"<leader>xq",
			function()
				require("trouble").open("quickfix")
			end,
			desc = "Quickfix list",
		},
	},
	opts = {
		auto_preview = false,
		auto_jump = true,
		focus = true,
		follow = true,
	},
}
