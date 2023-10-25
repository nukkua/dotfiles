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


