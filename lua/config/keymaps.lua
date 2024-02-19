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
}
for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end


