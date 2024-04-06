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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
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
		},
		version = false,
	},
}
