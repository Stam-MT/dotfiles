
-- telescope
vim.keymap.set("n", "tf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "tg", "<cmd>Telescope live_grep<CR>")

-- more keybinds in lsp_config.lua
-- (must be set when initializing language server)



-- telescope file browser
require("telescope").load_extension "file_browser"
vim.keymap.set("n", "tb", "<cmd>Telescope file_browser<CR>")
