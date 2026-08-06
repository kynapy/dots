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
            adapters = {
                http = {
                    llama_cpp = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                url = "http://127.0.0.1:8080",
                                api_key = "TERM",
                                chat_url = "/v1/chat/completions",
                            },
                            handlers = {
                                parse_message_meta = function(self, data)
                                    local extra = data.extra
                                    if extra and extra.reasoning_content then
                                        data.output.reasoning = { content = extra.reasoning_content }
                                        if data.output.content == "" then
                                            data.output.content = nil
                                        end
                                    end
                                    return data
                                end,
                            },
                        })
                    end,
                },
            },
            --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
            interactions = {
                -- Swap between copilot and local llama.cpp
                chat = { adapter = "copilot_acp", model = "auto" },
                -- chat = { adapter = "llama_cpp" },

                inline = { adapter = "llama_cpp" },
                cmd = { adapter = "copilot_acp" },
                background = { adapter = "copilot_acp" },
            },
            opts = { log_level = "DEBUG" },
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
