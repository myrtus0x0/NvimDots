-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
}
