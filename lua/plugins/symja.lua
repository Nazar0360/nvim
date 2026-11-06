return {
    {
        "Nazar0360/symja.nvim",
        name = "symja.nvim",
        lazy = false,
        build = "./backend/build.sh",
        config = function()
            local symja = require("symja")
            symja.setup({
                symja_version = vim.env.SYMJA_VERSION or "3.1.1",
                symja_home = vim.env.SYMJA_HOME,
                symja_lib_dir = vim.env.SYMJA_LIB_DIR,
            })
            if pcall(require, "cmp") then
                symja.register_cmp()
            end
        end,
    },
}
