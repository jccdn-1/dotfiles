return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local grp = vim.api.nvim_create_augroup("linting", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = grp,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>h", function()
			lint.try_lint()
		end, { desc = "Lint current file" })
	end,
}
