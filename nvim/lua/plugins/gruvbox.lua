
return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  lazy = false,
  config = function()
    -- must set BEFORE calling colorscheme
    vim.o.background = "dark"
    vim.g.gruvbox_material_palette = "mix"       -- 'material' | 'mix' | 'original'
    vim.g.gruvbox_material_background = "medium" -- 'hard' | 'medium' | 'soft'
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd("colorscheme gruvbox-material")
  end,
}
