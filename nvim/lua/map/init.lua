local api = vim.api

local function map(mode, lhs, rhs, opts, bufnr)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	if bufnr then
		api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
	else
		api.nvim_set_keymap(mode, lhs, rhs, options)
	end
end

return {
	map = map,
}
