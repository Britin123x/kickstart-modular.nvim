return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  enabled = false,
  opts = {
    markdown = {
      headings = require('markview.presets').headings.glow,
      horizontal_rules = require('markview.presets').horizontal_rules.dotted,
      tables = require('markview.presets').tables.rounded,
    },
  },
}
