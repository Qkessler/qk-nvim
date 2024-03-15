return {
  'ahmedkhalf/project.nvim',
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
      { '<leader>gs', '<cmd>Neogit<cr>', desc = 'Neogit' },
    },
  },
}
