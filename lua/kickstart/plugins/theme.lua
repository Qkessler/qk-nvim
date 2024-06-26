return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'sainnhe/gruvbox-material',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here.
      vim.g.gruvbox_material_better_performance = 1
      -- Themes
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_ui_contrast = 'high' -- The contrast of line numbers, indent lines, etc.

      vim.cmd.colorscheme 'gruvbox-material'
      vim.o.background = 'dark'

      -- Remove background on pop-ups.
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None', fg = 'None' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
