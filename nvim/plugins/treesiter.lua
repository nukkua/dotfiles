

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
