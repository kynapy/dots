return {
    -- Used to provide color highlighting for color codes in files
    "norcalli/nvim-colorizer.lua",
    config = function()
        local colorizer = require("colorizer")

        colorizer.setup({
            "css",
            "javascript",
            "typescript",
            html = { mode = "foreground" },
        })
    end,
    keys = {
        { "<leader>ct", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    },
}
