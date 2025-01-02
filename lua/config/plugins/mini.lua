local mini = {
    {
		"echasnovski/mini.nvim",
		config = function ()
			local status_line = require("mini.statusline")
			local setup_table = { use_icons = true }

			status_line.setup(setup_table)
		end
    }
}

return mini
