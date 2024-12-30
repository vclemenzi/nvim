return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	init = function()
		if vim.fn.argc() == 1 then
			local arg = vim.fn.argv(0)
			local stat = (vim.uv or vim.loop).fs_stat(arg)
			if stat and stat.type == "directory" then
				vim.cmd("Oil " .. vim.fn.fnameescape(arg))
			end
		end
	end,
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
		},
		columns = {
			"icon",
		},
	},
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {}, lazy = true }
	},
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer" },
	},
}
