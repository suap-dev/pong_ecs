local System = require("modules.concord.system")

local system = System({
    rectangles = { "position", "drawable", "rectangle", "color" },
    circles = { "position", "drawable", "circle", "color" }
})
function system:draw()
    for _, e in ipairs(self.rectangles) do
        love.graphics.setColor(unpack(e.color.rgb))
        love.graphics.rectangle(
            "fill",
            e.position.x, e.position.y,
            e.rectangle.width, e.rectangle.height
        )
    end

    for _, e in ipairs(self.circles) do
        love.graphics.setColor(unpack(e.color.rgb))
        love.graphics.circle(
            "fill",
            e.position.x, e.position.y,
            e.circle.radius
        )
    end
end

return system
