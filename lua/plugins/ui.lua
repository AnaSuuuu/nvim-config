return {
	{
		"willothy/veil.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim"
		},
		--config = true,
		config = function()
			local builtin = require("veil.builtin")
			require('veil').setup({
				sections = {
					builtin.sections.animated(builtin.headers.frames_nvim, {
						hl = { fg = "#5de4c7" },
					}),
					builtin.sections.buttons({
						{
							icon = "",
							text = "Find Files",
							shortcut = "fdf",
							callback = function()
								require("telescope.builtin").find_files()
							end,
						},
						{
							icon = "",
							text = "Find Word",
							shortcut = "fdw",
							callback = function()
								require("telescope.builtin").live_grep()
							end,
						},
						{
							icon = "",
							text = "Config",
							shortcut = "vim",
							callback = function()
								require("telescope").extensions.file_browser.file_browser({
									path = vim.fn.stdpath("config"),
								})
							end,
						},
						{
							icon = "",
							text = "Config",
							shortcut = "acm",
							callback = function()
								vim.cmd(':CompetiTest receive contest')
							end,
						},
					}),
				},
				mappings = {},
				startup = true,
				listed = false,
			})
		end
	},
--	{
--		'akinsho/bufferline.nvim',
--		version = "*",
--		dependencies = {
--			'nvim-tree/nvim-web-devicons',
--			'ryanoasis/vim-devicons',
--		},
--		opts = {
--			options = {
--				mode = "tabs",
--				indicator = {
--					icon = '▎', -- this should be omitted if indicator style is not 'icon'
--					-- style = 'icon' | 'underline' | 'none',
--					style = "icon",
--				},
--				diagnostics_indicator = function(count, level)
--					local icon = level:match("error") and " " or " "
--					return " " .. icon .. count
--				end,
--				numbers = function(opts)
--					local NumberIcon = {
--						"❶ ",
--						"❷ ",
--						"❸ ",
--						"❹ ",
--						"❺ ",
--						"❻ ",
--						"❼ ",
--						"❽ ",
--						"❾ ",
--						"❿ ",
--					}
--					return NumberIcon[tonumber(opts.ordinal)]
--				end,
--				show_buffer_close_icons = false,
--				show_close_icon = false,
--				show_duplicate_prefix = false,
--				tab_size = 10,
--				enforce_regular_tabs = false,
--				padding = 0,
--				separator_style = "thick",
--			}
--		}
--	},
	{
		'petertriho/nvim-scrollbar',
		dependencies = {
			'kevinhwang91/nvim-hlslens',
		},
		config = function()
			require("scrollbar").setup()
			require("scrollbar.handlers.search").setup()
			require("scrollbar").setup({
				show = true,
				handle = {
					text = " ",
					color = "#696969",
					hide_if_all_visible = true,
				},
				marks = {
					Search = { color = "yellow" },
					Misc = { color = "purple" },
				},
				handlers = {
					cursor = true,
					diagnostic = true,
					gitsigns = true,
					handle = true,
					search = true,
				},
			})
		end
	},
	{
		'm4xshen/smartcolumn.nvim',
		opts = {},
		config = function()
			require("smartcolumn").setup()
			require("smartcolumn").setup {
				custom_colorcolumn = {
					text = "0",
					veil = "0",
				}
			}
		end
	},
}
