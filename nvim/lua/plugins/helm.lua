return {
  { "towolf/vim-helm" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {},
      },
    },
  },

  { "ngalaiko/tree-sitter-go-template" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
    parsers = {},
  },
}
