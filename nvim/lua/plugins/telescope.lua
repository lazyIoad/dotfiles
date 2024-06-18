return {
	"nvim-telescope/telescope.nvim",
	opts = function()
		local open_with_trouble = require("trouble.sources.telescope").open

		return {
			defaults = {
				mappings = {
					i = { ["<c-t>"] = open_with_trouble },
					n = { ["<c-t>"] = open_with_trouble },
				},
			},
		}
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find file",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					-- sort_lastused = true,
					select_current = true,
					sort_mru = true,
				})
			end,
			desc = "Find buffer",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search in files",
		},
	},
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
}
