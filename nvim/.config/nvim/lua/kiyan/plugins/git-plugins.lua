return {
    -- Git Signs
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")

            gitsigns.setup({
                -- Add configuration here
            })

            vim.keymap.set("n", "<leader>gb", gitsigns.blame, { desc = "Git Blame" })
            vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })

            -- Toggles for gitsigns
            vim.keymap.set(
                "n",
                "<leader>gtb",
                gitsigns.toggle_current_line_blame,
                { desc = "Git Toggle Current Line Blame" }
            )
            vim.keymap.set("n", "<leader>gtd", gitsigns.toggle_word_diff, { desc = "Git Toggle Word Diff" })
            vim.keymap.set("n", "<leader>gth", gitsigns.preview_hunk, { desc = "Git Toggle Hunk" })
        end,
    },

    -- VIM Fugitive
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
        end,
    },

    -- Lazy Git
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = { { "<leader>lg", ":LazyGit<CR>", desc = "LazyGit" } },
    },
}
