return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.g.coc_global_extensions = {
      'coc-marketplace',
      '@yaegassy/coc-volar',
      'coc-tsserver',
      'coc-json',
      'coc-html', 'coc-css',
      'coc-clangd',
      'coc-go',
      'coc-sumneko-lua',
      'coc-vimlsp',
      'coc-sh', 'coc-db',
      'coc-java', 'coc-pyright',
      'coc-toml', 'coc-solidity',
      'coc-prettier',
      'coc-snippets', 'coc-pairs', 'coc-word',
      'coc-translator',
      'coc-git',
      -- 'coc-definition', 'coc-type-definition', 'coc-implementation', 'coc-references'
    }
    -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    -- delays and poor user experience
    vim.opt.updatetime = 300
    -- Always show the signcolumn, otherwise it would shift the text each time
    -- diagnostics appeared/became resolved
    vim.opt.signcolumn = "yes"

    local keyset = vim.keymap.set
    -- Autocomplete
    function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end 

    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    -- Use ` =` and ` -` to navigate diagnostics
    -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    keyset("n", "<LEADER>-", "<Plug>(coc-diagnostic-prev)", {silent = true})
    keyset("n", "<LEADER>=", "<Plug>(coc-diagnostic-next)", {silent = true})

    -- GoTo code navigation
    keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
    keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
    keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
    keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Use K to show documentation in preview window
      function _G.show_docs()
       local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
           vim.api.nvim_command('h ' .. cw)
       elseif vim.api.nvim_eval('coc#rpc#ready()') then
           vim.fn.CocActionAsync('doHover')
        else
           vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
       end
    end
    keyset("n", "D", '<CMD>lua _G.show_docs()<CR>', {silent = true})

    -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
    })
  end
}


