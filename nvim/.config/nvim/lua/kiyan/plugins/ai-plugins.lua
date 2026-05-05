return {
    -- Code Companion for AI code assistance
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
            interactions = {
                chat = { adapter = "copilot_acp", model = "gpt-5.3-codex" },
                inline = { adapter = "copilot_acp", model = "gpt-5.3-codex" },
                cmd = { adapter = "copilot_acp" },
                background = { adapter = "copilot_acp" },
            },
            opts = { log_level = "DEBUG", },
        },
        keys = {
            { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat" },
        },
    },

    -- Markdown rendering in chat buffers
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
    },
}
