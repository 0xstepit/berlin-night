local config = require("flow.config")
local theme = require("flow.theme")

local M = {}

M.name = "flow"

--- This function is called to setup the colorscheme options.
--- NOTE: this function is not called when executing `vim.cmd("colorscheme flow")`
M.setup = config._setup

--- This function is called when the colorscheme is activated.
--- It sets up the colorscheme by clearing existing highlights,
--- enabling true color support, setting the colorscheme name,
--- and applying the highlight groups defined in the theme.
--- @param opts FlowConfig?
function M.load(opts)
  -- Check if the current colorscheme is different from the one to be loaded.
  if vim.g.colors_name ~= M.name then
    -- Clear existing highlights.
    vim.cmd("hi clear")
    -- Enable true color support.
    vim.o.termguicolors = true
    -- Set the current colorscheme name.
    -- `:lua print(vim.g.colors_name)`
    vim.g.colors_name = M.name
  end

  if opts then
    M.config(opts)
  end

  local highlights = theme.configure()

  -- The heart of the plugin, where highlight groups are set.
  for group, c in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, c)
  end
end

return M
