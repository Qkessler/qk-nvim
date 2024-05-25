return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      vim.keymap.set('n', '<leader>ht', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon [T]oggle' })
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [A]ppend' })
      vim.keymap.set('n', "<leader>'", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>,', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>.', function()
        harpoon:list():select(3)
      end)
    end,
  },
}
