local util = require("flow.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  return util.template(M.template, colors)
end

M.template = [[
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:${grey5},hl:${yellow},border:${grey7} \
--color=fg+:${fg},hl+:${yellow} \
--color=info:${blue},prompt:${cyan},pointer:${pink1} \
--color=marker:${green},spinner:${pink1},header:${pink1}"
]]

return M
