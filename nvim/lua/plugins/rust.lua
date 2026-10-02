return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "K", function() vim.cmd.RustLsp("hover", "actions") end, { buffer = bufnr })
        end,
      },
    }
  end,
}
