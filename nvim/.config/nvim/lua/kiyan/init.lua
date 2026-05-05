require("kiyan.set")
require("kiyan.remap")
require("kiyan.lazy")
require("kiyan.float-terminal")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
    command = "setlocal ts=2 sw=2",
})
