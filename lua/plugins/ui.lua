return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      flavour = "mocha",
    },
  },
  {
    "RRethy/base16-nvim",
  },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruber-darker",
      -- colorscheme = "catppuccin",
      colorscheme = "base16-black-metal-gorgoroth",
      -- colorscheme = "base16-rose-pine",
    },
  },
}
