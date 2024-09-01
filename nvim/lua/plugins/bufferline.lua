return {
  "akinsho/bufferline.nvim",
  keys = {
    {
      "<A-S-h>",
      function()
        require("bufferline").move(-1)
      end,
      desc = "Move buffer left",
    },
    {
      "<A-S-l>",
      function()
        require("bufferline").move(1)
      end,
      desc = "Move buffer right",
    },
  },
}
