-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      { 'jvgrootveld/telescope-zoxide', dependencies = { 'nvim-telescope/telescope-file-browser.nvim' } },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local builtin = require 'telescope.builtin'
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   layout_config = {
        --     vertical =
        --   },
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = {
            theme = 'ivy',
            hidden = true,
          },
          live_grep = {
            theme = 'ivy',
          },
          lsp_references = {
            theme = 'ivy',
          },
          lsp_definitions = {
            theme = 'ivy',
          },
          lsp_implementations = {
            theme = 'ivy',
          },
          buffers = {
            show_all_buffers = true,
            sort_mru = true,
            mappings = {
              i = {
                ['<c-d>'] = 'delete_buffer',
              },
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
          -- zoxide = {
          --   mappings = {
          --     default = {
          --       action = function(selection)
          --         builtin.find_files { cwd = selection.path, find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' } }
          --       end,
          --     },
          --   },
          -- },
        },
      }

      -- Enable telescope extensions, if they are installed
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'ui-select'
      require('telescope').load_extension 'zoxide'
      require('telescope').load_extension 'file_browser'

      -- See `:help telescope.builtin`
      local extensions = require('telescope').extensions
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = '[P]roject [G]rep' })
      vim.keymap.set('n', '<leader>pp', extensions.zoxide.list, { desc = '[P]roject [P]icker' })
      vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[B]uffers' })
      vim.keymap.set('n', '<leader>hs', builtin.help_tags, { desc = '[H]elp [S]elp' })
      vim.keymap.set('n', '<leader><leader>', builtin.commands, { desc = '[ ] Commands' })

      -- open file_browser with the path of the current buffer
      vim.keymap.set('n', '<leader>ff', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[F]ile [F]inder' })

      vim.keymap.set('n', '<leader>pf', function()
        builtin.find_files { find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' } }
      end, { desc = '[P]roject [F]ind' })

      vim.keymap.set('n', '<leader>nf', function()
        builtin.find_files { cwd = vim.g.slipbox_dir }
      end, { desc = '[N]otes [F]ind' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>s', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>pn', function()
        builtin.find_files { find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }, cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
