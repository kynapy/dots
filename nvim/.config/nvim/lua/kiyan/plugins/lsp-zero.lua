return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        { "williamboman/mason.nvim" }, -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" }, -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "L3MON4D3/LuaSnip" }, -- Required
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        local lsp_attach = function(client, bufnr)
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false,
            })
        end

        lsp_zero.extend_lspconfig({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            lsp_attach = lsp_attach,
            float_border = "rounded",
            sign_text = true,
        })

        -- NOTE: Mason packages are installed in ~/.local/share/nvim/mason/
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {},
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        on_init = function(client)
                            lsp_zero.nvim_lua_settings(client, {})
                        end,
                    })
                end,
            },
        })
        local cmp = require("cmp")

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            }),
        })

        vim.lsp.config("lua_ls", {
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        })
    end,
}
