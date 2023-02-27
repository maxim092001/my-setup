local status = require("nvim-spotify").status

status:start()

local colors = {
	red = "#cdd6f4",
	grey = "#181825",
	black = "#1e1e2e",
	white = "#313244",
	light_green = "#6c7086",
	orange = "#fab387",
	green = "#a6e3a1",
	blue = "#80A7EA",
}

local modes = {
	"mode",
	fmt = function(str)
		return str:sub(1, 1)
	end,
	color = { bg = "#fab387		", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.black, fg = "#80A7EA" },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
}

local function getLspName()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	"diagnostics",
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = "#f38ba8", fg = "#1e1e2e" },
}

local branch = {
	"branch",
	color = { bg = "#a6e3a1", fg = "#313244" },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local fileformat = {
	"fileformat",
	color = { bg = "#b4befe", fg = "#313244" },
	separator = { left = "", right = "" },
}

local encoding = {
	"encoding",
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local filename = {
	"filename",
	color = { bg = "#80A7EA", fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
	separator = { left = "", right = "" },
}

require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			modes,
			vim_icons,
		},
		lualine_b = {
			space,
		},
		lualine_c = {
			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			encoding,
			fileformat,
			space,
		},
		lualine_y = {
			dia,
			lsp,
		},
		lualine_z = {
			status.listen,
		},
	},
})
