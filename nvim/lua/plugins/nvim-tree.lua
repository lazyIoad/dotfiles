local nvimTreeFocusOrToggle = function()
	local nvimTree = require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus()
	end
end

vim.api.nvim_create_autocmd({ "QuitPre" }, {
	callback = function()
		vim.cmd("NvimTreeClose")
	end,
})

return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			dotfiles = true,
		},
	},
	keys = {
		{
			"<leader>d",
			nvimTreeFocusOrToggle,
			desc = "Open or focus explorer",
		},
	},
}
