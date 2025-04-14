return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
  },
  keys = {
    {
      'K',
      function()
        if require('obsidian').util.cursor_on_markdown_link() then
          return '<cmd>ObsidianFollowLink<CR>'
        else
          return 'K'
        end
      end,
      noremap = false,
      expr = true,
      desc = 'Obsidian: Follow Lin[k]',
    },
    { '<leader>nt', '<cmd>Obsidiantemplate', desc = 'Obsidian: Insert [N]ew [T]emplate' },
    { '<leader>nf', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian: [F]ind [N]ote' },
    { '<leader>nn', '<cmd>ObsidianNew<CR>', desc = 'Obsidian: [N]ew [N]ote' },
    { '<leader>nl', '<cmd>ObsidianBacklinks', desc = 'Obsidian: Display [L]inked [N]otes' },
  },
  opts = {
    dir = '~/OneDrive/BritinObsidian',

    daily_notes = {
      folder = 'Daily Notes',
      date_format = '%m-%d-%Y',
      default_tags = { 'daily-notes' },
    },
    completion = {
      nvim_cmp = true,
    },
    new_notes_location = 'current_dir',
    use_advanced_uri = true,
    picker = {
      name = 'telescope.nvim',
    },
    ui = {
      enable = true,
      update_debounce = 200,
    },
  },
}
