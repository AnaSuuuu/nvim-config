return {
  "Eandrju/cellular-automaton.nvim",
  key = "<leader>rr",
  config = function ()
    vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
  end,
}
