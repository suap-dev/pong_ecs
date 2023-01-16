local System = require("modules.concord.system")

local screen = {}
screen.width, screen.height = love.graphics.getDimensions()

local top, bot, left, right

local sheriff = System({
    circles_with_velocity = { "bound_to_screen", "position", "velocity", "circle" },
    rectangles_with_velocity = { "bound_to_screen", "position", "velocity", "rectangle" },
})
function sheriff:ward()
    for _, e in ipairs(self.circles_with_velocity) do
        top, bot, left, right =
        e.position.y - e.circle.radius,
            e.position.y + e.circle.radius,
            e.position.x - e.circle.radius,
            e.position.x + e.circle.radius

        if (top <= 0 and e.velocity.y < 0)
            or (bot > screen.height and e.velocity.y > 0)
        then
            e.velocity.y = -e.velocity.y
        end

        if (left <= 0 and e.velocity.x < 0)
            or (right > screen.width and e.velocity.x > 0)
        then
            e.velocity.x = -e.velocity.x
        end
    end

    for _, e in ipairs(self.rectangles_with_velocity) do
        top, bot, left, right =
        e.position.y,
            e.position.y + e.rectangle.height,
            e.position.x,
            e.position.x + e.rectangle.width

        if (top <= 0 and e.velocity.y < 0)
            or (bot > screen.height and e.velocity.y > 0)
        then
            e.velocity.y = -e.velocity.y
        end

        if (left <= 0 and e.velocity.x < 0)
            or (right > screen.width and e.velocity.x > 0)
        then
            e.velocity.x = -e.velocity.x
        end
    end
end

return sheriff
