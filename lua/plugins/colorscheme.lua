return {
  "theniceboy/nvim-deus",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme deus]])
  end,
}

--return { 
    --"ellisonleao/gruvbox.nvim", 
    --priority = 1000, 
    --config = true
--}
