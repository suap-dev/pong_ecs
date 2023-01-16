local System = require("modules.concord.system")

local screen = {}
screen.width, screen.height = love.graphics.getDimensions()

local top, bot, left, right
local collisions

-- FIXME: remove code repetition
local system = System({
    circles_with_velocity = { "bound_to_screen", "position", "velocity", "circle" },
    rectangles_with_velocity = { "bound_to_screen", "position", "velocity", "rectangle" },
})
function system:ward()
    for _, e in ipairs(self.circles_with_velocity) do
        top, bot, left, right =
        e.position.y - e.circle.radius,
            e.position.y + e.circle.radius,
            e.position.x - e.circle.radius,
            e.position.x + e.circle.radius

        collisions = {}
        local any_collisions = false;
        if top <= 0 then
            collisions.top = true
            any_collisions = true
        end
        if bot >= screen.height then
            collisions.bot = true
            any_collisions = true
        end
        if left <= 0 then
            collisions.left = true
            any_collisions = true
        end
        if right >= screen.width then
            collisions.right = true
            any_collisions = true
        end

        if any_collisions then
            e:give("collides", collisions)
        else
            e:remove("collides")
        end
    end

    for _, e in ipairs(self.rectangles_with_velocity) do
        top, bot, left, right =
        e.position.y,
            e.position.y + e.rectangle.height,
            e.position.x,
            e.position.x + e.rectangle.width

        collisions = {}
        local any_collisions = false;
        if top <= 0 then
            collisions.top = true
            any_collisions = true
        end
        if bot >= screen.height then
            collisions.bot = true
            any_collisions = true
        end
        if left <= 0 then
            collisions.left = true
            any_collisions = true
        end
        if right >= screen.width then
            collisions.right = true
            any_collisions = true
        end

        if any_collisions then
            e:give("collides", collisions)
        else
            e:remove("collides")
        end
    end
end

return system
