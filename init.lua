-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- pylsp specifics
-- disable annoying formatter tip and extend max line length
require("lspconfig").pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>", { noremap = true, silent = true })
  vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-ScrollWheelUp>", "<ScrollWheelRight>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-ScrollWheelDown>", "<ScrollWheelLeft>", { noremap = true, silent = true })
  vim.o.guifont = "Iosevka Nerd Font Mono:h16"
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- Search and replace options
vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search matters if capital letter
vim.opt.inccommand = "split" -- "for incsearch while sub

-- Filtering behavior
vim.opt.wildmode = "list:longest,list:full" -- for : stuff
vim.opt.wildignore:append { ".javac", "node_modules", "*.pyc" }
vim.opt.wildignore:append {
  ".o",
  ".obj",
  ".dll",
  ".exe",
  ".so",
  ".a",
  ".lib",
  ".pyc",
  ".pyo",
  ".pyd",
  ".swp",
  ".swo",
  ".class",
  ".DS_Store",
  ".git",
  ".hg",
  ".orig",
}

-- Setup change directory keybind
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>", { desc = "cd to current buffer" })
