-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity/note-taking/obsidian-nvim" },
  { import = "astrocommunity/colorscheme/miasma-nvim" },
  -- import/override with your plugins folder
}
