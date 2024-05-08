return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"f-person/git-blame.nvim",
			-- main = "gitblame",
			config = function()
				vim.g.gitblame_display_virtual_text = 0
				vim.g.gitblame_message_template = "<author> • <date>"
				vim.g.gitblame_date_format = "%x"
				vim.g.gitblame_message_when_not_committed = "New"
			end,
			lazy = false,
		},
	},
	opts = function()
		return {
			sections = {
				lualine_b = { { "b:gitsigns_head", icon = "" } },
				lualine_x = {
					{ require("gitblame").get_current_blame_text, cond = require("gitblame").is_blame_text_available },
				},
			},
			theme = "auto",
		}
	end,
}
