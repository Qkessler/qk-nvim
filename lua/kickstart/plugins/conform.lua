return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt' },
        kotlin = { 'ktlint' },

        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        java = { { 'prettierd', 'prettier' } },
      },
      formatters = {
        prettierd = {
          prepend_args = { '--plugin=prettier-plugin-java' },
        },
        prettier = {
          prepend_args = { '--plugin=prettier-plugin-java' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
