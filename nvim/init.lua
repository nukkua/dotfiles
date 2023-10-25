-- Asegúrate de que packer esté instalado

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd 'packadd packer.nvim'
end


-- Tabbing


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


require'keymappings'
require'plugins.lualine'
require'plugins.tree'
require'plugins.webdevicons'
require'plugins.treesiter'
require'plugins.lsp'
require'plugins.autopairs'
require'plugins.compe'


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


vim.cmd('highlight NvimTreeNormal guibg=NONE')
vim.cmd('highlight NvimTreeNormalNC guibg=NONE')
vim.cmd [[let g:user_emmet_leader_key='<C-y>']]


