return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = {
			"*",
			tmux = {
				parsers = {
					hex = { rrggbb = true },
				},
			},
		},
		options = {
			parsers = {
				hex = { rrggbb = true },
			},
			display = {
				mode = "background",
			},
		},
	},
}
