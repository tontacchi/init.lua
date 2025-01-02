
vim.lsp.start(
	{
		name = "kotlin_language_server",
		cmd  = {"~/.local/share/nvim/mason/bin/kotlin-language-server"},
		root_dir = '.',
	}
)

