return {
    	-- better text objects
	{
		"echasnovski/mini.ai",
		keys = { { "[f", desc = "Prev function" }, { "]f", desc = "Next function" } },
		opts = function(plugin)
			-- call config of parent spec
			plugin._.super.config()

			-- add treesitter jumping
			local function jump(capture, start, down)
				local rhs = function()
					local parser = vim.treesitter.get_parser()
					if not parser then
						return vim.notify("No treesitter parser for the current buffer", vim.log.levels.ERROR)
					end

					local query = vim.treesitter.get_query(vim.bo.filetype, "textobjects")
					if not query then
						return vim.notify("No textobjects query for the current buffer", vim.log.levels.ERROR)
					end

					local cursor = vim.api.nvim_win_get_cursor(0)

					---@type {[1]:number, [2]:number}[]
					local locs = {}
					for _, tree in ipairs(parser:trees()) do
						for capture_id, node, _ in query:iter_captures(tree:root(), 0) do
							if query.captures[capture_id] == capture then
								local range = { node:range() } ---@type number[]
								local row = (start and range[1] or range[3]) + 1
								local col = (start and range[2] or range[4]) + 1
								if down and row > cursor[1] or (not down) and row < cursor[1] then
									table.insert(locs, { row, col })
								end
							end
						end
					end
					return pcall(vim.api.nvim_win_set_cursor, 0, down and locs[1] or locs[#locs])
				end

				local c = capture:sub(1, 1):lower()
				local lhs = (down and "]" or "[") .. (start and c or c:upper())
				local desc = (down and "Next " or "Prev ")
					.. (start and "start" or "end")
					.. " of "
					.. capture:gsub("%..*", "")
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			for _, capture in ipairs({ "function.outer", "class.outer" }) do
				for _, start in ipairs({ true, false }) do
					for _, down in ipairs({ true, false }) do
						jump(capture, start, down)
					end
				end
			end
		end,
	},
    
	-- better yank/paste
	{
		"kkharji/sqlite.lua",
		enabled = function()
			return not jit.os:find("Windows")
		end,
	},
	{
		"gbprod/yanky.nvim",
		enabled = true,
		event = "BufReadPost",
		config = function()
			-- vim.g.clipboard = {
			--   name = "xsel_override",
			--   copy = {
			--     ["+"] = "xsel --input --clipboard",
			--     ["*"] = "xsel --input --primary",
			--   },
			--   paste = {
			--     ["+"] = "xsel --output --clipboard",
			--     ["*"] = "xsel --output --primary",
			--   },
			--   cache_enabled = 1,
			-- }

			require("yanky").setup({
				highlight = {
					timer = 150,
				},
				ring = {
					storage = jit.os:find("Windows") and "shada" or "sqlite",
				},
			})

			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")

			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

			vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
			vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

			vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
			vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
			vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
			vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

			vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
			vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
			vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
			vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

			vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
			vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

			vim.keymap.set("n", "<leader>P", function()
				require("telescope").extensions.yank_history.yank_history({})
			end, { desc = "Paste from Yanky" })
		end,
	},

    	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = function()
			local icons = require("lazyvim.config").icons
			require("symbols-outline").setup({
				symbols = {
					File = { icon = icons.kinds.File, hl = "TSURI" },
					Module = { icon = icons.kinds.Module, hl = "TSNamespace" },
					Namespace = { icon = icons.kinds.Namespace, hl = "TSNamespace" },
					Package = { icon = icons.kinds.Package, hl = "TSNamespace" },
					Class = { icon = icons.kinds.Class, hl = "TSType" },
					Method = { icon = icons.kinds.Method, hl = "TSMethod" },
					Property = { icon = icons.kinds.Property, hl = "TSMethod" },
					Field = { icon = icons.kinds.Field, hl = "TSField" },
					Constructor = { icon = icons.kinds.Constructor, hl = "TSConstructor" },
					Enum = { icon = icons.kinds.Enum, hl = "TSType" },
					Interface = { icon = icons.kinds.Interface, hl = "TSType" },
					Function = { icon = icons.kinds.Function, hl = "TSFunction" },
					Variable = { icon = icons.kinds.Variable, hl = "TSConstant" },
					Constant = { icon = icons.kinds.Constant, hl = "TSConstant" },
					String = { icon = icons.kinds.String, hl = "TSString" },
					Number = { icon = icons.kinds.Number, hl = "TSNumber" },
					Boolean = { icon = icons.kinds.Boolean, hl = "TSBoolean" },
					Array = { icon = icons.kinds.Array, hl = "TSConstant" },
					Object = { icon = icons.kinds.Object, hl = "TSType" },
					Key = { icon = icons.kinds.Key, hl = "TSType" },
					Null = { icon = icons.kinds.Null, hl = "TSType" },
					EnumMember = { icon = icons.kinds.EnumMember, hl = "TSField" },
					Struct = { icon = icons.kinds.Struct, hl = "TSType" },
					Event = { icon = icons.kinds.Event, hl = "TSType" },
					Operator = { icon = icons.kinds.Operator, hl = "TSOperator" },
					TypeParameter = { icon = icons.kinds.TypeParameter, hl = "TSParameter" },
				},
			})
		end,
	},
    	{
		"gorbit99/codewindow.nvim",
		enabled = false,
		event = "BufReadPre",
		keys = {
			-- stylua: ignore
			{ "<leader>um", function() require("codewindow").toggle_minimap() end, desc = "Toggle Minimap" },
		},
		config = function()
			require("codewindow").setup({
				z_index = 25,
				auto_enable = true,
				exclude_filetypes = {
					"alpha",
					"dap-terminal",
					"DiffviewFiles",
					"git",
					"gitcommit",
					"help",
					"lazy",
					"lspinfo",
					"mason",
					"NeogitCommitMessage",
					"NeogitStatus",
					"neotest-summary",
					"neo-tree",
					"neo-tree-popup",
					"noice",
					"Outline",
					"qf",
					"spectre_panel",
					"toggleterm",
					"Trouble",
				},
			})
		end,
	},
    {
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = { { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "UndoTree Toggle" } },
		config = function()
			vim.g.undotree_TreeNodeShape = "◦" -- Alternative: '◉'
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	}, 
}
