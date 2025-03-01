local hsl = require("flow.util").hsl_to_hex

local M = {}

---Generates and returns a color palette using HSL and HEX values.
--- @param o FlowConfig: The available options.
---@return table
function M.get(o)
  local is_dark = o.theme.style == "dark"
  -- The colorscheme support 5 shades of colors.
  local shade = {
    very_dark = { S = 27, L = 20 },
    dark = { S = 50, L = 35 },
    default = {
      S = (not is_dark and 40) or 60,
      L = (not is_dark and 55) or 65,
    },
    light = { S = 40, L = 65 },
    very_light = { S = 50, L = 85 },
  }

  if o.colors.custom.light ~= "" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    shade[o.colors.mode].L = tonumber(o.colors.custom.light)
  end

  if o.colors.custom.saturation ~= "" then
    ---@diagnostic disable-next-line: assign-type-mismatch
    shade[o.colors.mode].S = tonumber(o.colors.custom.saturation)
  end

  local hue = {
    red = 355,
    purple = 270,
    blue = 230,
    light_blue = 205,
    sky_blue = 190,
    cyan = 165,
    green = 115,
    yellow = 60,
    orange = 25,
  }

  local fluo_hue = {
    pink = 331,
    cyan = 187,
    green = 115,
    yellow = 61,
    orange = 25,
  }

  local palette = {
    -- Transparent color
    transparent = "NONE",

    -- Base colors
    black = hsl(0, 0, 5),
    white = hsl(0, 0, 95),

    -- Greyscale colors
    grey = {
      [1] = hsl(203, 20, 10), -- Very dark grey
      [2] = hsl(203, 20, 13),
      [3] = hsl(203, 20, 15),
      [4] = hsl(203, 20, 29),
      [5] = hsl(203, 20, 35),
      [6] = hsl(203, 20, 65),
      [7] = hsl(203, 20, 85),
      [8] = hsl(203, 20, 88),
      [9] = hsl(203, 20, 90), -- Very light grey
    },

    -- Fluorescent colors
    fluo = {
      pink = {
        default = hsl(fluo_hue.pink, 100, 50),
        light = hsl(fluo_hue.pink, 100, 90),
        dark = hsl(fluo_hue.pink, 100, 35),
      },
      cyan = {
        default = hsl(fluo_hue.cyan, 100, 50),
        light = hsl(fluo_hue.cyan, 100, 90),
        dark = hsl(fluo_hue.cyan, 100, 30),
      },
      green = {
        default = hsl(fluo_hue.green, 100, 50),
        light = hsl(fluo_hue.green, 100, 100),
        dark = hsl(fluo_hue.green, 100, 30),
      },
      orange = {
        default = hsl(fluo_hue.orange, 100, 50),
        light = hsl(fluo_hue.orange, 100, 90),
        dark = hsl(fluo_hue.orange, 100, 35),
      },
      yellow = {
        default = hsl(fluo_hue.yellow, 100, 50),
        light = hsl(fluo_hue.yellow, 100, 90),
        dark = hsl(fluo_hue.yellow, 100, 30),
      },
    },

    -- Red shades
    red = {
      very_dark = hsl(hue.red, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.red, shade.dark.S, shade.dark.L),
      default = hsl(hue.red, shade.default.S, shade.default.L),
      light = hsl(hue.red, shade.light.S, shade.light.L),
      very_light = hsl(hue.red, shade.very_light.S, shade.very_light.L),
    },

    -- Purple shades
    purple = {
      very_dark = hsl(hue.purple, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.purple, shade.dark.S, shade.dark.L),
      default = hsl(hue.purple, shade.default.S, shade.default.L),
      light = hsl(hue.purple, shade.light.S, shade.light.L),
      very_light = hsl(hue.purple, shade.very_light.S, shade.very_light.L),
    },

    -- Blue shades
    blue = {
      very_dark = hsl(hue.blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.blue, shade.default.S, shade.default.L),
      light = hsl(hue.blue, shade.light.S, shade.light.L),
      very_light = hsl(hue.blue, shade.very_light.S, shade.very_light.L),
    },

    -- Light blue shades
    light_blue = {
      very_dark = hsl(hue.light_blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.light_blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.light_blue, shade.default.S, shade.default.L),
      light = hsl(hue.light_blue, shade.light.S, shade.light.L),
      very_light = hsl(hue.light_blue, shade.very_light.S, shade.very_light.L),
    },

    -- Sky blue shades
    sky_blue = {
      very_dark = hsl(hue.sky_blue, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.sky_blue, shade.dark.S, shade.dark.L),
      default = hsl(hue.sky_blue, shade.default.S, shade.default.L),
      light = hsl(hue.sky_blue, shade.light.S, shade.light.L),
      very_light = hsl(hue.sky_blue, shade.very_light.S, shade.very_light.L),
    },

    -- Cyan shades
    cyan = {
      very_dark = hsl(hue.cyan, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.cyan, shade.dark.S, shade.dark.L),
      default = hsl(hue.cyan, shade.default.S, shade.default.L),
      light = hsl(hue.cyan, shade.light.S, shade.light.L),
      very_light = hsl(hue.cyan, shade.very_light.S, shade.very_light.L),
    },

    -- Green shades
    green = {
      very_dark = hsl(hue.green, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.green, shade.dark.S, shade.dark.L),
      default = hsl(hue.green, shade.default.S, shade.default.L),
      light = hsl(hue.green, shade.light.S, shade.light.L),
      very_light = hsl(hue.green, shade.very_light.S, shade.very_light.L),
    },

    -- Orange shades
    orange = {
      very_dark = hsl(hue.orange, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.orange, shade.dark.S, shade.dark.L),
      default = hsl(hue.orange, shade.default.S, shade.default.L),
      light = hsl(hue.orange, shade.light.S, shade.light.L),
      very_light = hsl(hue.orange, shade.very_light.S, shade.very_light.L),
    },

    -- Yellow shades
    yellow = {
      very_dark = hsl(hue.yellow, shade.very_dark.S, shade.very_dark.L),
      dark = hsl(hue.yellow, shade.dark.S, shade.dark.L),
      default = hsl(hue.yellow, shade.default.S, shade.default.L),
      light = hsl(hue.yellow, shade.light.S, shade.light.L),
      very_light = hsl(hue.yellow, shade.very_light.S, shade.very_light.L),
    },
  }

  return palette
end

return M
