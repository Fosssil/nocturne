return {
    "stevearc/oil.nvim",
    lazy = false,

    dependencies = {
        "nvim-mini/mini.icons",
    },

    keys = {
        {
            "<leader>o",
            "<cmd>Oil<CR>",
            desc = "Explorer",
        },
        {
            "-",
            "<cmd>Oil<CR>",
            desc = "Parent Directory",
        },
        {
            "<leader>E",
            "<cmd>Oil --float<CR>",
            desc = "Floating Explorer",
        },
    },

    opts = {
        default_file_explorer = true,

        columns = {
            "icon",
        },

        delete_to_trash = false,

        skip_confirm_for_simple_edits = false,

        prompt_save_on_select_new_entry = true,

        constrain_cursor = "editable",

        watch_for_changes = false,

        view_options = {
            show_hidden = false,
            natural_order = "fast",
        },
    },
}
