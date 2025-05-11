return {
  "rcarriga/nvim-notify",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    local notify = require "notify"
    -- this for transparency
    notify.setup { background_colour = "#000000" }
    -- this overwrites the vim notify function
    -- vim.notify = notify.notify
  end,
}
