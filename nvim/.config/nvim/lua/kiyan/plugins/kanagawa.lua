return {
    "rebelot/kanagawa.nvim",
    config = function()
        require("kanagawa").setup({})

        vim.cmd.colorscheme("kanagawa-dragon")
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, "Comment", { italic = false })
    end,
}
