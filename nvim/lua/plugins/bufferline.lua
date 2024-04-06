return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.no_bold,
				diagnostics = "nvim_lsp",
				themable = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File",
						text_align = "left",
						separator = true,
					},
				},
			},
		})
	end,
	keys = {
		{
			"<A-h>",
			function()
				require("bufferline").cycle(-1)
			end,
			desc = "Previous buffer",
		},
		{
			"<A-l>",
			function()
				require("bufferline").cycle(1)
			end,
			desc = "Next buffer",
		},
		{
			"<A-S-h>",
			function()
				require("bufferline").move(-1)
			end,
			desc = "Move buffer left",
		},
		{
			"<A-S-l>",
			function()
				require("bufferline").move(1)
			end,
			desc = "Move buffer right",
		},
	},
	dependencies = "nvim-tree/nvim-web-devicons",
}
