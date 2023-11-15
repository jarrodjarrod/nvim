function Colour(colour)
    if not pcall(vim.cmd.colorscheme, colour) then vim.cmd.colorscheme('rose-pine-moon') end
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Cursor' })
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = '#ff66ff', bold = true })
    -- vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#ff66ff', fg = '#66ff66' })
end

if not vim.g.vscode then Colour('github_dark_tritanopia') end
