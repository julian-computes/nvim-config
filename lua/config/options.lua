vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- clear highlights when pressing enter after a search
vim.keymap.set("n", "<CR>", function()
  vim.cmd("nohlsearch")
end)

vim.cmd.colorscheme("tokyonight")
