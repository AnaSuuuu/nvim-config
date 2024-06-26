vim.g.mapleader = " "
vim.keymap.set("n", "<leader>py", vim.cmd.Ex)
local mode_n    = { "n" }
local mode_v    = { "v" }
local mode_i    = { "i" }
local mode_t    = { "t" }
local mode_nv   = { "n", "v" }
local nmappings = {
  -- base
  { from = "S",                to = ":w<CR>",                                                      mode = mode_n  },
  { from = "Q",                to = ":q<CR>",                                                      mode = mode_n  },
  -- move
  { from = "j",                to = "gj",                                                          mode = mode_n  },
  { from = "k",                to = "gk",                                                          mode = mode_n  },
  { from = "H",                to = "0",                                                           mode = mode_nv },
  { from = "J",                to = "5j",                                                         mode = mode_n  },
  { from = "K",                to = "5k",                                                         mode = mode_n  },
  { from = "L",                to = "$",                                                           mode = mode_nv },
  -- coc.explorer
  { from = "tt",                to = "<Cmd>CocCommand explorer<CR>",                                                           mode = mode_nv },

  -- Tab management
	{ from = "tn",            to = ":tabe<CR>", },
	{ from = "tN",            to = ":tab split<CR>", },
	{ from = "th",            to = ":-tabnext<CR>", },
	{ from = "tl",            to = ":+tabnext<CR>", },
	{ from = "tmh",           to = ":-tabmove<CR>", },
	{ from = "tml",           to = ":+tabmove<CR>", },
}
for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end


-- =======
local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }
local mode_i = { "i" }
local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")


local nmappings = {
	{ from = ";",             to = ":",                                                                   mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "`",             to = "~",                                                                   mode = mode_nv },
  { from = "<leader><cr>",  to = ":noh<CR>",                                                            mode = mode_n },
	-- Movement
	{ from = "K",             to = "5k",                                                                  mode = mode_nv },
	{ from = "J",             to = "5j",                                                                  mode = mode_nv },
	{ from = "H",             to = "0",                                                                   mode = mode_nv },
	{ from = "L",             to = "$",                                                                   mode = mode_nv },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
