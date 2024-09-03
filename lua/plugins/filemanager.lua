return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        --config = function ()
            --require('telescope-file-browser').setup()
            ---- vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

            ---- open file_browser with the path of the current buffer
            --vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

        --end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
        require("nvim-tree").setup {}
        end,
    }
    
}

