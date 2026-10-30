return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],

        hide_numbers = true,
        shade_filetypes = {},
        autochdir = false,

        direction = "float",
        -- direction = "horizontal",

    --
    --     highlights = {
    --         Normal = {
    --             guibg = "<VALUE-HERE>",
    --         },
    --         NormalFloat = {
    --             link = "Normal",
    --         },
    --         FloatBorder = {
    --             guifg = "<VALUE-HERE>",
    --             guibg = "<VALUE-HERE>",
    --         },
    --     },
    --
    --     shade_terminals = true,
    --     shading_factor = "<number>",
    --     shading_ratio = "<number>",
    --
    --     persist_size = true,
    --     persist_mode = true,
    --
    --     close_on_exit = true,
    --     clear_env = false,
    --
    --     shell = vim.o.shell,
    --     auto_scroll = true,
    --
        -- float_opts = {
        --     border = "single",
        --     -- width = "<value>",
        --     -- height = "<value>",
        --     -- row = "<value>",
        --     -- col = "<value>",
        --     winblend = 3,
        --     -- zindex = "<value>",
        --     title_pos = "left",
        -- },
    --
    --     winbar = {
    --         enabled = false,
    --         name_formatter = function(term)
    --             return term.name
    --         end,
    --     },
    --
    --     responsiveness = {
    --         horizontal_breakpoint = 135,
    --         size = 20,
    --     },
    },
}
