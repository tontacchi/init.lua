-- source under cursor / highlight
vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>")  -- source & run entire file
vim.keymap.set("n", "<space>x", ":.lua<cr>")                 -- run current line
vim.keymap.set("v", "<space>x", ":lua<cr>")                  -- run highlighted lines

-- netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")

-- toggle folds
vim.keymap.set("n", ",", "za")

-- highlight whole file
vim.keymap.set("n", "<C-a>", "ggVG")

-- new tab
-- vim.keymap.set("n", "<space>te", "<cmd>tabedit<cr>")
-- vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
-- vim.keymap.set("n", "<s-tab>", "<cmd>tabprev<cr>")

-- duplicate current window w/ split
vim.keymap.set("n", "<space>ss", "<cmd>split<cr>")
vim.keymap.set("n", "<space>sv", "<cmd>vsplit<cr>")

-- terminal to right, <esc> exits terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")
vim.keymap.set("n", "<space>te", function()
	vim.cmd.vnew()
	vim.cmd.te()
	vim.cmd.wincmd("L")
end)

-- small terminal at bottom of screen
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.new()
	vim.cmd.te()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

-- move lines while reformating
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- yank -> system clipboard
vim.keymap.set("v", "<space>y", "\"+y")  -- 1) highlighted
vim.keymap.set("n", "<space>y", "\"+Y")  -- 2) current line
vim.keymap.set("n", "<space>Y", "\"+y")  -- 3) starts motion. lines jumped are yanked

-- append line below w/ space. cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in place during half page jumps
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- first paste over highlight does not overwrite yanked text
vim.keymap.set("x", "<space>p", "\"_dP")

-- substitute / replace all instances of word under cursor
vim.keymap.set("n", "<space>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- next and previous command completion handled in line with vim motions
vim.keymap.set("c", "<c-j>", "<c-n>")
vim.keymap.set("c", "<c-k>", "<c-p>")

-- omnicomplete, menu navigation
vim.keymap.set("i", "<c-space>", "<c-x><c-o>")
vim.keymap.set("i", "<c-j>", "<c-n>")
vim.keymap.set("i", "<c-k>", "<c-p>")

-- toggle diagnostic text
local showDiagnostic = true
vim.keymap.set("n", "<leader>lv", function()
	showDiagnostic = not showDiagnostic
	vim.diagnostic.config({
		virtual_text = showDiagnostic,
		underline    = showDiagnostic,
		signs        = showDiagnostic,
	})

	if not showDiagnostic then
		print("hidden LSP diagnostics")
	else
		print("showing LSP diagonsitcs")
	end
end)

