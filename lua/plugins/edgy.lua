return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader><leader>",
			function()
				local view = require("diffview.lib").get_current_view()
				if view then
					vim.cmd("DiffviewClose")
				else
					vim.cmd("DiffviewOpen")
				end
			end,
			desc = "Toggle Diffview",
		},
	},
	opts = {
		left = {
			{
				title = "Diffview",
				ft = "DiffviewFiles",
				size = { width = 0.3 },
			},
			{
				title = "Diffview File History",
				ft = "DiffviewFileHistory",
				size = { width = 0.3 },
			},
		},
	},
}
