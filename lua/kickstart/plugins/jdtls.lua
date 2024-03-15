return {
  {
    'mfussenegger/nvim-jdtls',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local function setup_jdtls()
        local mason_path = require 'mason-core.path'
        local function get_install_path(package)
          return require('mason-registry').get_package(package):get_install_path()
        end

        local root_dir = require('jdtls.setup').find_root({ 'packageInfo' }, 'Config')
        local home = os.getenv 'HOME'
        local ws_folders_jdtls = {}
        if root_dir then
          local file = io.open(root_dir .. '/.bemol/ws_root_folders')
          if file then
            for line in file:lines() do
              table.insert(ws_folders_jdtls, 'file://' .. line)
            end
            file:close()
          end
        end

        local config = {
          cmd = {
            mason_path.concat { get_install_path 'jdtls', 'jdtls' },
            '-noverify',
            '--illegal-access=warn',
            '-Xmx8G',
            '-XX:+UseG1GC',
            '-XX:+UseStringDeduplication',
            '--jvm-arg=-javaagent:' .. home .. '/.lombok/lombok.jar',
          },
          root_dir = root_dir,
          init_options = {
            workspaceFolders = ws_folders_jdtls,
          },
        }
        require('jdtls').start_or_attach(config)
      end

      local augroup = vim.api.nvim_create_augroup('jdtls', {})
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        group = augroup,
        callback = setup_jdtls,
      })
    end,
  },
}
