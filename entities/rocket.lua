local Entity = require("modules.concord.entity")

return function(x, y, width, height, rgb)
    return Entity()
        :give("position", x, y)
        :give("velocity", 0, 0)
        :give("rectangle", 15, 80)
        :give("drawable")
        :give("color", rgb)
end
