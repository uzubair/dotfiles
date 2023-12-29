return {

	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "New file", "<cmd>ene <CR>"),
			dashboard.button("SPC e e", "Open File Tree"),
			dashboard.button("SPC f f", "Search files"),
			dashboard.button("SPC f o", "Search Recently opened files"),
			dashboard.button("SPC f p", "Search Projects"),
			dashboard.button("SPC f l", "Search Git Repositories"),
			dashboard.button("SPC f g", "Search Git Branches"),
			dashboard.button("SPC f u", "Current Buffers"),
			dashboard.button("SPC f r", "Resume Telescope"),
		}
		_Gopts = {
			position = "center",
			hl = "Type",
			-- wrap = "overflow";
		}

		local function footer()
			return "There is no knowledge that is not power..."
		end

		dashboard.section.footer.val = footer()

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
