return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-s>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-l>",
                },
                ignore_filetypes = { cpp = true }, -- or { "cpp", }
                color = {
                    suggestion_color = "#808080",
                    cterm = 244,
                },
                log_level = "off",           -- set to "off" to disable logging completely
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false,     -- disables built in keymaps for more manual control
                condition = function()
                    return false
                end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
            })
        end,
    }
}
