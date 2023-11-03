function Colour(colour)
    colour = colour or 'rose-pine-moon'
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#ff66ff', fg = '#66ff66' })
end

if not vim.g.vscode then Colour('gruvbox-material') end
