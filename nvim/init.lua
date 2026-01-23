require("config.lazy")

vim.opt.conceallevel = 1
vim.o.relativenumber = true

-- Highlight matching braces
vim.opt.showmatch = true
vim.opt.matchtime = 2  -- 0.2s

-- GNU-style indentation for C/C++
local grp = vim.api.nvim_create_augroup("cpp_gnu_style", {})
vim.api.nvim_create_autocmd("FileType", {
  group = grp,
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 8
    vim.opt_local.expandtab = false
    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = ":0,l1,t0,g0,(0,W1"
  end,
})



require("obsidian").setup({
  workspaces = {
    {
      name = "main",
      path = "/home/nmcdonald/Documents/My Vault/Main Notes",
    },
  },

note_frontmatter_func = function(note)
    local out = {
      id = note.id,
      aliases = note.aliases,
      tags = note.tags,
    }
    if note.title then
      out["title"] = note.title
    end
    return out
  end,
})
