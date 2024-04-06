return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1001,
	opts = {
		variant = "auto",
		dark_variant = "moon",
		extend_background_behind_borders = true,
	},
	init = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
