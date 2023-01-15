local Entity = require("modules.concord.entity")

return function(x, y, radius, rgb)
    return Entity()
        :give("position", x, y)
        :give("velocity", 0, 0)
        :give("circle", radius)
        :give("drawable")
        :give("color", rgb)
end
