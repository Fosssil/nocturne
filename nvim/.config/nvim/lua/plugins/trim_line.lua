return {
    "cappyzawa/trim.nvim",

    opts = {
        trim_on_write = true,

        trim_trailing = true,
        trim_first_line = true,
        trim_last_line = true,
        trim_current_line = true,

        highlight = false,
        notifications = false,

        ft_blocklist = {
            "markdown",
        },
    },
}
