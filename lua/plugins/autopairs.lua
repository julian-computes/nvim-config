return {
	"windwp/nvim-autopairs",
	opts = function(_, opts)
		-- disable autopairs for clojure files
		opts.disable_filetype = opts.disable_filetype or {}
		table.insert(opts.disable_filetype, "clojure")
		return opts
	end,
}
