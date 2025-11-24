-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"clojure",
			"zig",
			"rust",
			-- add more arguments for adding more treesitter parsers
		},
	},
}
