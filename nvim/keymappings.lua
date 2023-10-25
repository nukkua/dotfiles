vim.opt.clipboard:append("unnamedplus")

-- Spliting windows
vim.opt.splitright = true
vim.opt.splitbelow = true





vim.g.mapleader = " "




vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


vim.g.nvim_tree_highlight_opened_files = 1
-- Configuraciones para NvimTree

vim.g.nvim_tree_side = 'left' -- Lado en el que se abre el NvimTree
vim.g.nvim_tree_width = 20 -- Define el ancho del NvimTree
vim.g.nvim_tree_indent_markers = 1 -- Esto muestra los marcadores de sangría como en NetBeans
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 muestra los archivos ocultos
vim.g.nvim_tree_git_hl = 1 -- Resalta los archivos que están en el estado git
vim.g.nvim_tree_root_folder_modifier = ":~" -- Esto mostrará la raíz del árbol como el directorio del proyecto actual


vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>f', ':Files<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>g', ':Ag<CR>', { noremap = true, silent = true })


-- Usando <Leader>cc como ejemplo
vim.api.nvim_set_keymap('n', '<Space>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Space>/', ':Commentary<CR>', { noremap = true, silent = true })


local options = { noremap = true, silent = true }

-- Mover líneas en modo normal
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', options)
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', options)

-- Mover líneas en modo insertar
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', options)
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', options)

-- Mover líneas en modo visual
vim.api.nvim_set_keymap('v', '<C-j>', ':m \'>+1<CR>gv=gv', options)
vim.api.nvim_set_keymap('v', '<C-k>', ':m \'<-2<CR>gv=gv', options)



vim.opt.relativenumber = true
vim.opt.number = true

-- Indentación
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.expandtab = true



-- highlight line
vim.opt.cursorline = true

