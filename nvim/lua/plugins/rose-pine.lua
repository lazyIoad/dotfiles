return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1001,
    opts = {
      variant = "auto",
      dark_variant = "moon",
    },
    keys = {
      {
        "<leader>Cl",
        function()
          vim.cmd("colorscheme rose-pine-dawn")
        end,
        desc = "Switch to light colorscheme",
      },
      {
        "<leader>Cd",
        function()
          vim.cmd("colorscheme rose-pine-moon")
        end,
        desc = "Switch to dark colorscheme",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
