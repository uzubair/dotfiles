return {

	"folke/which-key.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
	},

	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		-- border
		wk.setup({
			window = {
				border = "double",
			},
		})

		local terminal = require("toggleterm.terminal").Terminal

		local toggle_float = function()
			local float = terminal:new({ direction = "float" })
			return float:toggle()
		end

		local toggle_lazygit = function()
			local lazygit = terminal:new({ cmd = "lazygit", direction = "float" })
			return lazygit:toggle()
		end

		-- Keymaps
		local mappings = {
			-- Basic Operations
			q = { ":q<cr>", "Quit File" },
			Q = { ":q!<cr>", "Force Quit File" },
			w = { ":w<cr>", "Save File" },
			W = { ":w!<cr>", "Force Save File" },
			X = { ":x!<cr>", "Force Save and Quit File" },
			J = {mode="v", prefix=":m '<-2<CR>gv=gv", desc="Move selected text down"},
			K = {mode="v", prefix=":m '<-2<CR>gv=gv", desc="Move selected text up"},
			x = {'"_x', "Delete single char without copying to register" },
			d = {mode='{"n", "x"}', prefix='"_d', desc="Delete for real"},
			D = {mode="x", prefix='"_dP', desc="Throws away the selected text and pastes"},

			-- Control Operations
			c = {
				a = {mode="n", prefix="gg<S-v>G", desc="Select all text"},
				h = {mode="c", prefix="<HOME>", desc="Go to beginning of the command"},
				d = {mode="i", prefix="<DEL>", desc="Delete the cursor to the right of the cursor"},
				e = {mode="n", prefix="<cmd>!chmod +x %<CR>", desc="Enable execute mode", silent = true },
				c = {mode="v", prefix='"+y', noremap = true, desc="Copy the text"},
				s = {mode="n", prefix='"+P', noremap = true, desc="Paste the text"},
				m = {mode="n", prefix=":nohlsearch<cr>", noremap = false, silent = false, desc="Unhighlight searched elements"},
				l = {mode="v", prefix="<gv", noremap = true, silent = false, desc="Indent left" },
				r = {mode="v", prefix=">gv", noremap = true, silent = false, desc="Indent right" },
			},

			-- Split
			v = {":vsplit<cr>", "Split Vertically"},
			h = {":split<cr>", "Split Vertically"},

			-- Vim-Maximizer: Mazimize split window
			vm = {":MaximizerToggle<CR>"},

			-- Vim-fugutive for git commands
			g = {":G<cr>", "Vim fugitive"},

			-- Buffers
			b = {
				name = "buffers",

				x = { ":bdelete<cr>", "Close Buffer" },
				n = { ":bnext<cr>", "Next Buffer" },
				l = { ":blast<cr>", "Last Buffer" },
			},

			Ec = { ":e ~/.config/nvim<cr>", "Edit Configs" },

			-- NvimTree
			e = {
				name = "NvimTree",
				e = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
				f = { ":NvimTreeFocus<cr>", "NvimTreeFocus" },
				h = { ":e ~/<cr>", "NvimTreeHome" },
			},

			-- Telescope
			f = {
				name = "Telescope",
				f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
				w = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
				o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
				g = { ":Telescope live_grep theme=ivy<cr>", "Telescope live_grep" },
				r = { ":Telescope resume theme=ivy<cr>", "Telescope resume" },
				b = { ":Telescope buffers theme=ivy<cr>", "Telescope buffers" },
			},

			-- Tab management
			T = {
				name = "Tabs",
				o = {":tabnew<CR>", "Open wew tab"},
				x = {":tabclose<CR>", "Close current tab"},
				n = {":tabn<CR>", "Go to next tab"},
				p = {":tabp<CR>", "Go to previous tab"},
				-- Tagbar for function list
				f = { ":TagbarToggle<cr>", "Functions List Tagbar" },
			},

			-- Split
			p = {
				name = "Window management",
				e = {"<C-w>=", "Make split windows equal in width and height"},
				x = {":close<CR>", "Close the current window"},
				h = {":wincmd h<CR>", "Move to left window"},
				j = {":wincmd j<CR>", "Move to bottom window"},
				k = {":wincmd k<CR>", "Move to top window"},
				l = {":wincmd l<CR>", "Move to right window"},
				p = {":vertical resize +20<CR>", "Vertical resize +20"},
				m = {":vertical resize -20<CR>", "Vertical resize -20"},
			},

			-- Terminal
			t = {
				t = { ":ToggleTerm<cr>", "Split Below" },
				f = { toggle_float, "Floating Terminal" },
				l = { toggle_lazygit, "LazyGit" },
			},

			-- Lsp Stuffs
			l = {
				name = "LSP",
				i = { ":LspInfo<cr>", "Connected Language Servers" },
				k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
				K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
				w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
					"List Workspace Folders",
				},
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
				r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
				R = { "<cmd>Lspsaga rename<cr>", "Rename" },
				a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
				n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
				N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
			},

			-- Code Formatting
			F = {
				name = "Code Formoat",
				M = { ":lua vim.lsp.buf.format()<cr>", "Format code" },
			},

			m = {
				name = "Markdown controls",
				p = {":<C-U>MarkdownPreview<CR>", "Start Preview Markdown"},
				s = {":<C-U>MarkdownPreviewStop<CR>", "Stop Markdown Preview"},
			},
		}

		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts)
	end,
}
