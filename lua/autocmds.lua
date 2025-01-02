
vim.api.nvim_create_autocmd(
    "TermOpen",
    {
		desc  = "Removes line numbers in opened terminals",
		group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
		callback = function()
			vim.opt.number = false
			vim.opt.relativenumber = false
		end
    }
)

vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
		desc  = "Highlights when yanking / copying text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function() vim.highlight.on_yank() end
    }
)

-- comment w/ ctrl + / for each file type
vim.api.nvim_create_autocmd(
	"FileType",
	{
		pattern = "kotlin",
		callback = function()
			vim.api.nvim_buf_set_keymap(0, 'i', "<C-_>", "//", {nowait = true, silent = true})
		end
	}
)

