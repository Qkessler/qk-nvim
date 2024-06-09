return {
  {
    'https://git.sr.ht/~soywod/himalaya-vim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
      { '<leader>am', '<cmd>Himalaya<cr>', desc = '[A]pplication [M]ail' },
    },
    config = function()
      vim.g.himalaya_folder_picker = 'telescope'
    end,
  },
}
