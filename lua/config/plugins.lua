
-- 官方配置代码
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- "Kicamon/gruvbox",
  require("plugins.competitest"), -- used in competition 
  require("plugins.colorscheme"), -- custom the color
  require("plugins.editor"),      -- useful plugins when editing
  require("plugins.ui"),          -- customied UI  
  require("plugins.notify"),      -- notification plug
  require("plugins.gitsigns"),    -- unknown 
  require("plugins.treesitter"),  -- treesitter, unknown 
  require("plugins.lsp"),         -- coc
  -- require("plugins.nerd"),
})
