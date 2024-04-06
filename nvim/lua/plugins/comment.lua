return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "Comment",
	opts = function()
		return {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
	end,
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			main = "ts_context_commentstring",
			config = true,
		},
	},
}
