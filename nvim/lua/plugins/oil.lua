return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"<leader>o",
			function()
				require("oil").toggle_float()
			end,
			desc = "Toggle file explorer",
		},
	},
}
