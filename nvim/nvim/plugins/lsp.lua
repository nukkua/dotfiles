local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	--lsp.default_keymaps({buffer = bufnr})

	vim.keymap.set('n', '<leader>e', vim.lsp.buf.format, opts)

	vim.keymap.set('n', '<leader>vd', function()
	end, opts)

	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'kotlin_language_server',
		'asm_lsp',
		'ltex',
		'htmx',
		'clangd',
		'bashls',
		'emmet_ls',
		'graphql',
		'astro',
		'svelte',
		'gopls',
		'lua_ls',
		'rust_analyzer',
		'jedi_language_server',
		'omnisharp',
		'ansiblels',
		'cssls',
		'dockerls',
		'docker_compose_language_service',
		'eslint',
		'html',
		'jsonls',
		'tsserver',
		'marksman',
		'taplo',
		'yamlls',
		'tailwindcss',
		'prismals',
		'sqlls',
		'cmake',
		'zls',
		'jqls',
	},
	handlers = {
		lsp.default_setup
	}
})

local lspconfig = require('lspconfig')
lspconfig.astro.setup({})
lspconfig.omnisharp.setup({})
lspconfig.dartls.setup({})

lspconfig.tsserver.setup({
})

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	--	sources = {
	--		{ name = 'nvim_lsp' }
	--	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete()
	})
})
