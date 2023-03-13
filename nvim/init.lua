--[[
-- Part 0: PRELUDE
--]]
local keymap = vim.api.nvim_set_keymap
local fn = vim.fn


--[[
-- Part 1: OPTIONS
--]]
local options = {
  -- Show absolute line number for current line
  number = true,
  -- And relative numbers surrounding
  relativenumber = true,
  -- Enable mouse mode
  mouse = "a",
  -- Don't wrap long lines
  wrap = false,
  -- Add a visual ruler at 80 chars
  colorcolumn = "80",
  -- Save undo history
  undofile = true,
  -- Case insensitive search unless using /C or capitals
  ignorecase = true,
  smartcase = true,
  -- Disable highlighting cursor line
  cursorline = false,
  -- Keep 7 vertical surrounding lines in view while scrolling
  scrolloff = 7,
  -- More colors
  termguicolors = true,
  -- Indentation options (use soft tabs, 4 characters wide)
  autoindent = true,
  smartindent = true,
  expandtab = true,
  shiftwidth = 2, -- shift indent by 2
  tabstop = 8, -- display tabs as 8 columns
  -- Use system clipboard
  clipboard = "unnamedplus",
  -- Completion options
  completeopt = { "menuone", "noselect" },
  -- Pop-up menu max height of 10
  pumheight = 10,
  -- Force horizontal splits below
  splitbelow = true,
  -- Force vertical splits right
  splitright = true,
  -- Always show sign column
  signcolumn = "yes",
}

-- Don't show completion messages
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


--[[
-- Part 2: KEYMAPS
--]]
local keymap_opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode maps
-- Clear highlights
keymap("n", "<Leader>l", ":nohl<CR>", keymap_opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", keymap_opts)
keymap("n", "<C-j>", "<C-w>j", keymap_opts)
keymap("n", "<C-k>", "<C-w>k", keymap_opts)
keymap("n", "<C-l>", "<C-w>l", keymap_opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", keymap_opts)
keymap("n", "<A-h>", ":bprevious<CR>", keymap_opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", keymap_opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", keymap_opts)

-- Insert mode maps
-- Press jk fast to exit insert
keymap("i", "jk", "<Esc>", keymap_opts)

-- Visual mode maps
-- Stay in visual mode after indenting
keymap("v", "<", "<gv", keymap_opts)
keymap("v", ">", ">gv", keymap_opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", keymap_opts)
keymap("v", "<A-k>", ":m .-2<CR>==", keymap_opts)
-- Preserve pasted text in register
keymap("v", "p", '"_dP', keymap_opts)

-- Nvim-tree
keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", keymap_opts)

-- Telescope
keymap("n", "<Leader>ff", ":Telescope find_files<CR>", keymap_opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", keymap_opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", keymap_opts)
keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", keymap_opts)


--[[
-- Part 3: PLUGINS
--]]
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd [[packadd packer.nvim]]
  return
end

local packer = require("packer")

-- Plugins
packer.startup(function(use)
  -- foundation
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }

  -- cmp & co
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip"

  -- lsp
  use "neovim/nvim-lspconfig"

  -- tree
  use "kyazdani42/nvim-tree.lua"

  -- rust
  use "simrat39/rust-tools.nvim"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- colorscheme
  -- use "rebelot/kanagawa.nvim"
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup()
    end
})

  -- gitsigns
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }

  -- true-zen
  use {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup()
    end
  }

  -- surround
  use "tpope/vim-surround"

  -- git
  use "tpope/vim-fugitive"

  -- hopping
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- vim.cmd [[colorscheme kanagawa]]
vim.cmd [[colorscheme rose-pine-moon]]


--[[
-- Part 4: COMPLETIONS
--]]
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    -- Supertab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
}

-- Use cmdline source for ":"
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "cmdline" }
  })
})


--[[
-- Part 5: LSP
--]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local lsp = require("lspconfig")

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, keymap_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, keymap_opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {'gopls'}
for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach,
    flags = lsp_flags,
  }
end

require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    flags = lsp_flags,
  }
})


--[[
-- Part 6: NVIM-TREE
--]]
require("nvim-tree").setup {
  disable_netrw = true,
  actions = {
    open_file = {
      resize_window = true
    }
  }
}


--[[
-- Part 7: TREE-SITTER
--]]
-- Use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 20

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = false },
}

