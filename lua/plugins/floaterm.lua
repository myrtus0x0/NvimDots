return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")
  end,
}
