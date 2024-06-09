return {
  'ahmedkhalf/project.nvim',
  {
    'sindrets/diffview.nvim',
    config = true,
    keys = {
      { '<leader>gl', '<cmd>DiffviewFileHistory %<cr>', desc = 'File [G]it [L]og' },
    },
  },
  {
    'NeogitOrg/neogit',
    branch = 'nightly',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    keys = {
      { '<leader>gs', '<cmd>Neogit cwd=%:p:h<cr>', desc = '[G]it [S]tatus' },
    },
  },
  {
    'FabijanZulj/blame.nvim',
    config = true,
    keys = {
      { '<leader>gb', '<cmd>BlameToggle<cr>', desc = '[G]it [B]lame' },
    },
  },
}
