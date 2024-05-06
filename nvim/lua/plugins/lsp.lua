return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local ts = require("telescope.builtin")
		local trouble = require("trouble")

		local function lsp_attach(client, bufnr)
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end

			map("n", "crr", vim.lsp.buf.code_action, "Code actions")
			map("v", "<C-R>r", vim.lsp.buf.code_action, "Code actions")
			map("v", "<C-R><C-R>", vim.lsp.buf.code_action, "Code actions")
			map("n", "crn", vim.lsp.buf.rename, "Rename")
			map("n", "gr", vim.lsp.buf.references, "References")
			map("i", "<C-S>", vim.lsp.buf.signature_help, "Signature help")
			map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
			map("n", "]d", vim.diagnostic.goto_prev, "Next diagnostic")

			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "gd", vim.lsp.buf.definition, "Go to definition")
			map("n", "<leader>ld", ts.lsp_definitions, "(telescope) Open definitions")
			map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
			map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
			map("n", "<leader>li", ts.lsp_implementations, "(telescope) Open implementations")
			map("n", "<space>D", vim.lsp.buf.type_definition, "Go to type definition")
			map("n", "<leader>lt", ts.lsp_type_definitions, "(telescope) Open type definitions")
			map("n", "<leader>lr", function()
				trouble.toggle("lsp_references")
			end, "(trouble) Open references")
			map("n", "<leader>lh", ts.diagnostics, "(telescope) Open diagnostics")
		end

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
			on_attach = lsp_attach,
			capabilities = capabilities,
		})

		local exec = vim.fn.executable

		if exec("rust-analyzer") == 1 then
			lspconfig.rust_analyzer.setup({})
		end

		if exec("gopls") == 1 then
			lspconfig.gopls.setup({})
		end

		require("cmp").setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			completion = { autocomplete = false },
		})
	end,
}
