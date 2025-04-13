return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavor = "macchiato",
    transparent_background = true,
    show_end_of_buffer = true,
    term_colors = true,
    dim_inactive = {
      enabled = true,
    },
  },
  init = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}
