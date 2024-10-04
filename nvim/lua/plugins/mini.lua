return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.icons").setup()
            require("mini.tabline").setup()
        end
    },
}
