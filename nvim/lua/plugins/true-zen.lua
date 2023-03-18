return {
  "Pocco81/true-zen.nvim",
  opts = {
    modes = {
      ataraxis = {
        minimum_writing_area = {
          width = 100,
        },
        quit_untoggles = false,
      },
    },
    integrations = {
      lualine = true,
    },
  },
  keys = {
    { "<leader>za", ":TZAtaraxis<CR>", desc = "Ataraxis mode" },
  },
}
