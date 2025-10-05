-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.git.diffview-nvim" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.typescript-all-in-one" },
	{ import = "astrocommunity.motion.leap-nvim" },
	{ import = "astrocommunity.motion.mini-basics" },
	{ import = "astrocommunity.motion.mini-ai" },
	{ import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.test.neotest" },
	{ import = "astrocommunity.utility.noice-nvim" },
	-- import/override with your plugins folder
}
