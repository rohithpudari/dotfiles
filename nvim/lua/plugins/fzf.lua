return {
    "ibhagwan/fzf-lua",
    opts={
        file_icons = false,
        git_icons = false,
        color_icons = false,
        formatter = "path.filename_first",
    },
    keys={
        { 
            "<leader>f",
            function() require('fzf-lua').files() end,
            desc="Find Files in project directory"
        },
        { 
            "<leader>fg",
            function() require('fzf-lua').live_grep() end,
            desc="Find by grepping in project directory"
        },
        { 
            "<leader>fc",
            function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
            desc="Find in neovim configuration"
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "[F]ind [H]elp",
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[F]ind [K]eymaps",
        },
        {
            "<leader>fr",
            function()
                require("fzf-lua").resume()
            end,
            desc = "[F]ind [R]esume",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[,] Find existing buffers",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "[F]ind [B]uiltin FZF",
        },
    }
}
