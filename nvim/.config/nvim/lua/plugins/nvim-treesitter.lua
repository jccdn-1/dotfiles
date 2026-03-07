return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
