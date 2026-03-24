return {
    {
        dir = "~/.config/nvim/lua/header/",
        config = function()
		vim.keymap.set('n', '<leader>h', function()
		    require("header").insert_header()
		end, {desc = "insert 42 header"})
        end
    }
}
