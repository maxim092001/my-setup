local setup = function()
	require("themer").setup({
		colorscheme = "onedark",
		styles = {
				comment = { style = 'italic' },
				["function"] = { style = 'italic' },
				functionbuiltin = { style = 'italic' },
				variable = { style = 'italic' },
				variableBuiltIn = { style = 'italic' },
				parameter  = { style = 'italic' },
		},
	})
end

return {
	setup = setup
}