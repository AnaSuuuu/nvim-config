vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>py", vim.cmd.Ex)
local mode_n    = { "n" }
local mode_v    = { "v" }
local mode_i    = { "i" }
local mode_t    = { "t" }
local mode_nv   = { "n", "v" }



local nmappings = {
  -- Tab management
	{ from = "tn",            to = ":tabe<CR>", },
	{ from = "tN",            to = ":tab split<CR>", },
	{ from = "th",            to = ":-tabnext<CR>", },
	{ from = "tl",            to = ":+tabnext<CR>", },
	{ from = "tmh",           to = ":-tabmove<CR>", },
	{ from = "tml",           to = ":+tabmove<CR>", },

    -- ---------- 插入模式 ---------- ---
    -- keymap.set("i", "jk", "<ESC>")
    -- insert mode: jk -> <ESC> 
    { from = "jk",            to = "<ESC>",                                                        mode = mode_i },
}
for _, mapping in ipairs(nmappings) do
--   vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end


-- =======
local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }
local mode_i = { "i" }
local keymap = vim.keymap


-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- base
keymap.set("n", "S", ":w<CR>")
keymap.set("n", "Q", ":wq<CR>")

  -- move
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "H", "0")
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")
keymap.set("n", "L", "$")

-- ---------- 正常模式 ---------- ---
-- 窗口
-- keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
-- keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
-- keymap.set("n", "<C-L>", ":bnext<CR>")
-- keymap.set("n", "<C-H>", ":bprevious<CR>")


local nmappings = {
	{ from = ";",             to = ":",                                                                   mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "`",             to = "~",                                                                   mode = mode_nv },
  { from = "<leader><cr>",  to = ":noh<CR>",                                                            mode = mode_n },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
