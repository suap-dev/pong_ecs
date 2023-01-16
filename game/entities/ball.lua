local Entity = require("modules.concord.entity")

local x, y = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
local radius = 15
local color = { 0, 0, 1 } -- blue

return Entity()
    :give("position", x, y)
    :give("circle", radius)
    :give("color", color)
    :give("drawable")
    :give("velocity", 200, -200)    -- FIXME: this is gonna blow in my face later
    :give("bound_to_screen")
    :give("ai")
