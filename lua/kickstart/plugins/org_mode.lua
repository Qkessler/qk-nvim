return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/slipbox-sync/slipbox/pages/*_project*',
        org_default_notes_file = '~/slipbox-sync/slipbox/pages/refile.org',
      }
      vim.b.org_indent_mode = false
    end,
  },
}
