local Entity = require("modules.concord.entity")

local width, height = 15, 80
local x, y = love.graphics.getWidth() - width - 20, 20
local color = { 0, 1, 0 } -- green

return Entity()
    :give("position", x, y)
    :give("rectangle", width, height)
    :give("color", color)
    :give("drawable")
    :give("velocity", 0, 0)
