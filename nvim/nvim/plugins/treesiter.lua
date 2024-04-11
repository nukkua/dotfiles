require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "astro", "python", "javascript", "html", "css", "bash", "lua", "rust", "go", "php", "typescript", "svelte", "dart", "zig", "kotlin", "c", "sql", "cpp", "prisma" },
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	auto_install = true,
}
