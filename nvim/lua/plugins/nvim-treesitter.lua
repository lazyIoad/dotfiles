return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		main = "nvim-treesitter.configs",
		opts = {
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ia"] = {
							query = "@parameter.inner",
							desc = "Select inner part of a parameter",
						},
						["aa"] = {
							query = "@parameter.outer",
							desc = "Select outer part of a parameter",
						},
					},
					include_surrounding_whitespace = true,
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = {
							query = "@function.outer",
							desc = "Next function start",
						},
						["]a"] = {
							query = "@parameter.inner",
							desc = "Next parameter start",
						},
					},
					goto_previous_start = {
						["[f"] = {
							query = "@function.outer",
							desc = "Previous function start",
						},
						["[a"] = {
							query = "@parameter.inner",
							desc = "Previous parameter start",
						},
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sa"] = {
							query = "@parameter.inner",
							desc = "Swap with next parameter",
						},
					},
					swap_previous = {
						["<leader>sA"] = {
							query = "@parameter.inner",
							desc = "Swap with previous parameter",
						},
					},
				},
			},
			textsubjects = {
				enable = true,
				prev_selection = ",",
				keymaps = {
					["."] = {
						"textsubjects-smart",
						desc = "Smart select",
					},
					[";"] = {
						"textsubjects-container-outer",
						desc = "Select outside containers (classes, functions, etc)",
					},
					["i;"] = {
						"textsubjects-container-inner",
						desc = "Select inside containers (classes, functions, etc)",
					},
				},
			},
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
					vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
					vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
				end,
			},
			{
				"RRethy/nvim-treesitter-textsubjects",
			},
		},
		version = false,
	},
}
