return {
  {
    url = 'enrikes@git.amazon.com:pkg/NinjaHooks',
    branch = 'mainline',
    lazy = false,
    config = function(plugin)
      vim.opt.rtp:prepend(plugin.dir .. '/configuration/vim/amazon/brazil-config')
      -- Make my own filetype thing to override neovim applying ".conf" file type.
      -- You may or may not need this depending on your setup.
      vim.filetype.add {
        filename = {
          ['Config'] = function()
            vim.b.brazil_package_Config = 1
            return 'brazil-config'
          end,
        },
      }
    end,
  },
  {
    'ibhagwan/fzf-lua',
    keys = {
      {
        '<leader>as',
        function()
          require('codesearch.fzf').code_search()
        end,
        mode = { 'n', 'v' },
        silent = true,
        desc = '[A]mazon Code [S]earch',
      },
    },
    dependencies = { {
      url = 'enrikes@git.amazon.com:pkg/NvimCodeSearch',
      branch = 'mainline',
      lazy = false,
    } },
  },
}
