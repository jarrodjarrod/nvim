vim.g.jazzimoto_colorscheme = "rose-pine"

function ColorMyPencils(colour)
	local status, _ = pcall(vim.cmd, "colorscheme " .. vim.g.jazzimoto_colorscheme)

	if not status then
		vim.notify("colorscheme " .. vim.g.jazzimoto_colorscheme .. " not found!")
		return
	end
end

ColorMyPencils()
