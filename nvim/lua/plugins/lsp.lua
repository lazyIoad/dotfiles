local lsp_servers = { gopls = "gopls" }

local available_servers
do
	local tbl_17_auto = {}
	local i_18_auto = #tbl_17_auto
	for exec, lsp in pairs(lsp_servers) do
		local val_19_auto
		if vim.fn.executable(exec) == 1 then
			val_19_auto = lsp
		else
			val_19_auto = nil
		end
		if nil ~= val_19_auto then
			i_18_auto = (i_18_auto + 1)
			do
			end
			(tbl_17_auto)[i_18_auto] = val_19_auto
		else
		end
	end
	available_servers = tbl_17_auto
end

local function _3_()
	vim.g.lsp_zero_extend_cmp = 0
	vim.g.lsp_zero_extend_lspconfig = 0
	return nil
end

local function _4_()
	local lsp_zero = require("lsp-zero")
	lsp_zero.extend_cmp()
	local cmp = require("cmp")
	return cmp.setup({ completion = { autocomplete = false } })
end
local function _5_()
	local lsp_zero = require("lsp-zero")
	lsp_zero.extend_lspconfig()
	local function _6_(_, bufnr)
		local ts = require("telescope.builtin")
		local trouble = require("trouble")
		-- local rt = require("rust-tools")
		local function _7_()
			local _8_
			-- if vim.bo.filetype == "rust" then
			-- 	_8_ = rt.hover_actions.hover_actions
			-- else
			_8_ = vim.lsp.buf.hover
			return _8_()
		end
		vim.keymap.set("n", "<leader>lk", _7_, { buffer = bufnr, desc = "Display symbol hover information" })
		local function _10_()
			local _11_
			if vim.bo.filetype == "rust" then
				-- _11_ = rt.hover_range.hover_range
			else
				_11_ = vim.lsp.buf.hover
			end
			return _11_()
		end
		vim.keymap.set("x", "<leader>lk", _10_, { buffer = bufnr, desc = "Display symbol hover information" })
		local function _13_()
			return ts.lsp_definitions()
		end
		vim.keymap.set("n", "<leader>ld", _13_, { buffer = bufnr, desc = "Jump to symbol definition" })
		local function _14_()
			return vim.lsp.buf.declaration()
		end
		vim.keymap.set("n", "<leader>lD", _14_, { buffer = bufnr, desc = "Jump to symbol declaration" })
		local function _15_()
			return ts.lsp_implementations()
		end
		vim.keymap.set("n", "<leader>li", _15_, { buffer = bufnr, desc = "List symbol implementations" })
		local function _16_()
			return ts.lsp_type_definitions()
		end
		vim.keymap.set("n", "<leader>lt", _16_, { buffer = bufnr, desc = "Jump to symbol type definition" })
		local function _17_()
			local function _18_()
				return trouble.toggle("lsp_references")
			end
			return _18_()
		end
		vim.keymap.set("n", "<leader>lr", _17_, { buffer = bufnr, desc = "List symbol references" })
		local function _19_()
			return vim.lsp.buf.signature_help()
		end
		vim.keymap.set("i", "<C-s>", _19_, { buffer = bufnr, desc = "Display symbol signature info" })
		local function _20_()
			return vim.lsp.buf.rename()
		end
		vim.keymap.set("n", "<leader>ln", _20_, { buffer = bufnr, desc = "Rename symbol" })
		local function _21_()
			local function _22_()
				return vim.lsp.buf.format({ async = true })
			end
			return _22_()
		end
		vim.keymap.set("n", "<leader>lf", _21_, { buffer = bufnr, desc = "Format buffer" })
		local function _23_()
			local function _24_()
				return vim.lsp.buf.format({ async = true })
			end
			return _24_()
		end
		vim.keymap.set("x", "<leader>lf", _23_, { buffer = bufnr, desc = "Format selection" })
		local function _25_()
			return vim.lsp.buf.code_action()
		end
		vim.keymap.set("n", "<leader>lc", _25_, { buffer = bufnr, desc = "Display code actions" })
		local function _26_()
			local _27_
			if vim.lsp.buf.range_code_action then
				_27_ = vim.lsp.buf.range_code_action
			else
				_27_ = vim.lsp.buf.code_action
			end
			return _27_()
		end
		vim.keymap.set("x", "<leader>lc", _26_, { buffer = bufnr, desc = "Display code actions" })
		local function _29_()
			return ts.diagnostics()
		end
		vim.keymap.set("n", "<leader>lh", _29_, { buffer = bufnr, desc = "Display diagnostics" })
		local function _30_()
			return vim.diagnostic.goto_prev()
		end
		vim.keymap.set("n", "[d", _30_, { buffer = bufnr, desc = "Previous diagnostic" })
		local function _31_()
			return vim.diagnostic.goto_next()
		end
		return vim.keymap.set("n", "]d", _31_, { buffer = bufnr, desc = "Next diagnostic" })
	end
	lsp_zero.on_attach(_6_)
	return lsp_zero.setup_servers(available_servers)
end
return {
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, init = _3_, config = false },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = { { "L3MON4D3/LuaSnip", build = "make install_jsregexp" } },
		config = _4_,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = _5_,
	},
}
