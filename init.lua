-- Asegúrate de que packer esté instalado

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd 'packadd packer.nvim'
end


-- Tabbing
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



-- Lualine osea la status line de neovim
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Arbol de archivos
require'nvim-tree'.setup {
  -- tu configuración aquí
  update_focused_file = {
    enable = true
  }
}


vim.g.nvim_tree_highlight_opened_files = 1
-- Configuraciones para NvimTree

vim.g.nvim_tree_side = 'left' -- Lado en el que se abre el NvimTree
vim.g.nvim_tree_width = 20 -- Define el ancho del NvimTree
vim.g.nvim_tree_indent_markers = 1 -- Esto muestra los marcadores de sangría como en NetBeans
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 muestra los archivos ocultos
vim.g.nvim_tree_git_hl = 1 -- Resalta los archivos que están en el estado git
vim.g.nvim_tree_root_folder_modifier = ":~" -- Esto mostrará la raíz del árbol como el directorio del proyecto actual

-- Configura NvimTree para abrir y cerrar con un atajo



-- NVIM icons of the tree
require'nvim-web-devicons'.setup {
   default = '',
   symlink = '',
   git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
   },
   folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
   },
   lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
  },-- tu configuración aquí
}



-- TREESITER

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "javascript", "html", "css", "bash", "lua", "rust", "go", "php", "typescript","svelte", "dart", "zig","kotlin","c","latex","sql", "dart"},
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  auto_install = true,
	 
}

	
-- Atajos:
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>f', ':Files<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>g', ':Ag<CR>', { noremap = true, silent = true })


-- Usando <Leader>cc como ejemplo
vim.api.nvim_set_keymap('n', '<Space>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Space>/', ':Commentary<CR>', { noremap = true, silent = true })



--  LSPPPP
local lspconfig = require('lspconfig')
lspconfig.unocss.setup{}
lspconfig.pyright.setup{}
lspconfig.intelephense.setup{}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.clangd.setup{}
lspconfig.html.setup{}
lspconfig.tsserver.setup{}
-- lspconfig.javascript.setup{}
lspconfig.svelte.setup{
   cmd = { "svelteserver", "--stdio" },
   filetypes = { "svelte" },
   root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
   settings = {
      svelte = {
         plugin = {
            svelte = {
               format = {
                  enable = true
               }
            }
         }
      }
   }
}

-- Configuración de plugins

require('packer').startup(function()
  -- Packer puede administrarse a sí mismo
  use {'wbthomason/packer.nvim',
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  'folke/tokyonight.nvim',
  'neovim/nvim-lspconfig',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'kyazdani42/nvim-tree.lua',
  'kyazdani42/nvim-web-devicons',
  'hoob3rt/lualine.nvim',
  'tpope/vim-commentary',
  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-nvim-lsp',
  -- 'nvim-lua/telescope.nvim',
  -- 'nvim-telescope/telescope-fzf-native.nvim',
  -- 'ThePrimeagen/harpoon',

  'windwp/nvim-autopairs', 
  'hrsh7th/nvim-compe',
  'junegunn/fzf.vim',
  'windwp/nvim-ts-autotag',
  'mattn/emmet-vim',


    }

end)



  
-- TRANSPARENCIA DEL EDITOR
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[set background=dark]]
vim.cmd[[ hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi NormalNC guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi VertSplit guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]]

vim.cmd[[highlight NvimTreeFolderIcon guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeFolderName guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeIndentMarker guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeFileRenamed guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeFileName guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeImageFile guifg=#FFC0CB]]
vim.cmd[[highlight NvimTreeSpecialFile guifg=#FFC0CB]]
-- INTELLISENSE
-- local cmp = require'cmp'

-- cmp.setup({
--     completion = {
--         completeopt = 'menu,menuone,noinsert',
--     },
--     snippet = {
--         expand = function(args)
--             require'luasnip'.lsp_expand(args.body)
--         end,
--     },
--     mapping = {
--         ['<Tab>'] = cmp.mapping.select_next_item(),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'buffer' },
--     }
-- })

local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }

-- Mover líneas en modo normal
map('n', '<C-j>', ':m .+1<CR>==', options)
map('n', '<C-k>', ':m .-2<CR>==', options)

-- Mover líneas en modo insertar
map('i', '<C-j>', '<Esc>:m .+1<CR>==gi', options)
map('i', '<C-k>', '<Esc>:m .-2<CR>==gi', options)

-- Mover líneas en modo visual
map('v', '<C-j>', ':m \'>+1<CR>gv=gv', options)
map('v', '<C-k>', ':m \'<-2<CR>gv=gv', options)


require'nvim-ts-autotag'.setup()


-- Autopair brackets
local npairs = require('nvim-autopairs')
-- Configura autopairs
npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})


-- Configura autopairs para trabajar con nvim-compe
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})

--Compe like is an intelissense



--Mapeos adicionales para confirmar y cerrar el menú de autocompletado


require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'always';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
        snippets_nvim = true;
    };
}





-- Configuración de línea de números
-- vim.wo.number = true

vim.opt.relativenumber = true
vim.opt.number = true

-- Indentación
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- vim.bo.expandtab = true



-- highlight line
vim.opt.cursorline = true

vim.cmd('highlight NvimTreeNormal guibg=NONE')

vim.cmd('highlight NvimTreeNormalNC guibg=NONE')


-- System clipboard
vim.opt.clipboard:append("unnamedplus")

-- Spliting windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd [[let g:user_emmet_leader_key='<C-y>']]

