local Entity = require("modules.concord.entity")

local x, y = 20, 20
local width, height = 15, 80
local color = { 1, 0, 0 } -- red
local move_speed = 300

return Entity()
    :give("position", x, y)
    :give("rectangle", width, height)
    :give("color", color)
    :give("drawable")
    :give("velocity", 0, 0)
    :give("controlable", "w", "s", move_speed)
