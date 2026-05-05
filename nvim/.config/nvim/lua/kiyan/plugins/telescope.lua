return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },

    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find String" })
        vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find Current" })
        vim.keymap.set("n", "<leader>todo", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })

        telescope.load_extension("fzf")

        -- For trouble
        local actions = require("telescope.actions")
        local open_with_trouble = require("trouble.sources.telescope").open

        -- Use this to add more results without clearing the trouble list
        local add_to_trouble = require("trouble.sources.telescope").add

        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules" },
                -- layout_strategy = "vertical",  -- Allows us to change the layout

                -- For trouble
                mappings = {
                    i = { ["<c-t>"] = open_with_trouble },
                    n = { ["<c-t>"] = open_with_trouble },
                },
            },
        })
    end,
}
