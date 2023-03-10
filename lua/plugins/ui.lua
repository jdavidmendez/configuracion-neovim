return {
    
	{
		"akinsho/nvim-toggleterm.lua",
		keys = "<C-`>",
		event = "VeryLazy",
		init = function()
			-- Hide number column for
			-- vim.cmd [[au TermOpen * setlocal nonumber norelativenumber]]

			-- Esc twice to get to normal mode
			vim.cmd([[tnoremap <ESC> <C-\><C-N>]])
		end,
		opts = {
			size = 20,
			open_mapping = [[<C-`>]],
			shading_factor = 0.3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			direction = "float",
		},
	},
    {
		"anuvyklack/windows.nvim",
		event = "WinNew",
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim", enabled = false },
		},
		keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
		config = function()
			vim.o.winminwidth = 5
			vim.o.winminwidth = 5
			vim.o.equalalways = false
			require("windows").setup({
				animation = { enable = false, duration = 150 },
			})
		end,
	},
    	-- bufferline
	{
		"akinsho/bufferline.nvim",
		opts = function(_, opts)
			opts.options.show_close_icon = true
			opts.options.separator_style = "slant"
			opts.options.offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "Outline",
					text = "Symbols Outline",
					highlight = "TSType",
					text_align = "left",
				},
			}
			opts.options.hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			}
		end,
	},
    	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		opts = function(_, opts)
			opts.level = vim.log.levels.INFO
			opts.fps = 144
			opts.stages = "fade_in_slide_out"
		end,
	},


}