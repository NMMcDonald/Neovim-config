return {
  "epwalsh/pomo.nvim",
  version = "*",
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    { "rcarriga/nvim-notify", lazy = false },  -- ensure notify loads first
  },
  config = function()
    -- Initialize nvim-notify
    vim.notify = require("notify")

    -- Setup pomo.nvim
    require("pomo").setup({
      update_interval = 1000,
      notifiers = {
        {
          name = "Default",
          opts = { sticky = false, title_icon = "󱎫", text_icon = "󰄉" },
        },
        { name = "System" },
      },
      timers = { Break = { { name = "System" } } },
      sessions = {
        pomodoro = {
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Long Break", duration = "15m" },
        },
      },
    })
  end,
}

