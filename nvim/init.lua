-- Asegúrate de que packer esté instalado

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd 'packadd packer.nvim'
end


-- Tabbing

-- Tabbing
local config_path = vim.fn.stdpath('config')
package.path = config_path .. "/?.lua;" .. package.path
package.path = config_path .. "/?/init.lua;" .. package.path


vim.opt.termguicolors = true

require('packer').startup(function(use)
    -- Packer can manage itself
    use ('wbthomason/packer.nvim')
	use ('tpope/vim-commentary')
	use ('kyazdani42/nvim-web-devicons')
	use ('junegunn/fzf.vim')
	use ('mattn/emmet-vim')
    -- use {
    --     'nvim-telescope/telescope.nvim', tag = '0.1.3',
    --     -- or                            , branch = '0.1.x',
    --     requires = { {'nvim-lua/plenary.nvim'} }
    -- }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    -- use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('nvim-treesitter/nvim-treesitter-context')
    use{
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

end)
-- vim.cmd[[colorscheme tokyonight]]
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

require'colorsget'
require'keymappings'
require'plugins.lualine'
require'plugins.undotree'
-- require'plugins.tree'
require'plugins.webdevicons'
require'plugins.treesiter'
require'plugins.lsp'
-- require'plugins.autopairs'
-- require'plugins.compe'



