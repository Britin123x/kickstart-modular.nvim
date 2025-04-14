-- Alternatively, use `config = function() ... end` for full control over the configuration.
-- If you prefer to call `setup` explicitly, use:
--    {
--        'lewis6991/gitsigns.nvim',
--        config = function()
--            require('gitsigns').setup({
--                -- Your gitsigns configuration here
--            })
--        end,
--    }
--
-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      { "]c", function() 
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          require('gitsigns').nav_hunk('next')
        end
      end, desc = "Jump to next git [c]hange"},
      { "[c", function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          require('gitsigns').nav_hunk('previous')
        end
      end, desc = "Jump to previous git [c]hange"},
      -- Visual Mode
      { "<leader>hs", function ()
      require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, mode = "v", desc = "git [s]tage hunk"},
      { "<leader>hr", function()
        require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, mode = "v", desc = "git [r]eset hunk" },
      { "<leader>hs", require('gitsigns').stage_hunk, mode = "n", desc = "git [s]tage hunk" },
      { "<leader>hr", require('gitsigns').reset_hunk, mode = "n", desc = "git [r]eset hunk" },
      { "<leader>hS", require('gitsigns').stage_buffer, desc = "git [S]tage buffer" },
      { "<leader>hu", require('gitsigns').stage_hunk, desc = "git [u]ndo stage hunk" },
      { "<leader>hR", require('gitsigns').reset_buffer, desc = "git [R]eset buffer " },
      { "<leader>hp", require('gitsigns').preview_hunk, desc = "git [p]review hunk" },
      { "<leader>hb", require('gitsigns').blame_line, desc = "git [b]lame line" },
      { "<leader>hd", require('gitsigns').diffthis, desc = "git [d]iff against index" },
      { "<leader>hD", function() 
        require('gitsigns').diffthis '@'
      end, desc = "git [D]iff against last commit" },
      -- Toggles
      {"<leader>tb", require('gitsigns').toggle_current_line_blame, desc = "[T]oggle git show [b]lame line"},
      {"<leader>tD", require('gitsigns').preview_hunk_inline, desc = "[T]oggle git show [D]eleted" },
  },
  },
}
-- vim: ts=2 sts=2 sw=2 et
