return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template-string" },
                java = false,
            },
        })
    end,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
