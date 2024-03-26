vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Same for `maplocalleader`

vim.keymap.set('n','<leader>n', '<cmd>set relativenumber!<CR>', { desc = "Toggle relativenumber" })
vim.keymap.set('i','<C-s>', '<C-o>:w<ENTER><ESC>', { desc = "Save File in Insert mode" })
vim.keymap.set('n','<C-s>', ':w<ENTER>', { desc = "Save File in Normal mode" })

-- move cursor in insert mode
vim.keymap.set('i','<C-h>', '<C-o>h')
vim.keymap.set('i','<C-j>', '<C-o>j')
vim.keymap.set('i','<C-k>', '<C-o>k')
vim.keymap.set('i','<C-l>', '<C-o>l')

-- exit inert mode without escape key
vim.keymap.set('i', 'jk', "<ESC>", { desc = 'Escape insert mode'})

-- highlight on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set({'n', 'v'}, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({'n', 'v'}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({'n', 'v'}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({'n', 'v'}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
