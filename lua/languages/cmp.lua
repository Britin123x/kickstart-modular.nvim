return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter" },
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      { 
        'SirVer/ultisnips',
        keys = { 
          {"<leader>sn", UltiSnipsEdit, desc = "[S]nippets: Create [N]ew"}, 
        },
        opts = { },
        init = function()
          vim.g.UltiSnipsSnippetDirectories = {"~/AppData/Local/nvim/snippets"}
        end,
      },
      {
        'quangnguyen30192/cmp-nvim-ultisnips', 
        requires = { "nvim-treesitter/nvim-treesitter" }, 
        opts = {
          filetype_source = "ultisnips_default",
          show_snippets = "all",
          documentation = function(snippet)
            return snippet.description .. "\n\n" .. snippet.value
          end,

        },
      },

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require('cmp')
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ), 
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        }),
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
