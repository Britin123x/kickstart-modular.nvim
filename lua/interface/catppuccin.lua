return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavor = "mocha",
	term_colors = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
    transparent_background = true,
    show_end_of_buffer = true,
    term_colors = true,
    dim_inactive = {
      enabled = true,
    },
	integrations = {
		cmp = true,
		gitsigns = true,
		neotree = true,
		markdown = true,
		mason = true,
		treesitter = true,
		which_key = true,
	},
  },
  init = function()
    vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
