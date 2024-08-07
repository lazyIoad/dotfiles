return {
  "stevearc/oil.nvim",
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "<leader>o",
      function()
        require("oil").toggle_float()
      end,
      desc = "Toggle file explorer",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
