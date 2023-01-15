local Component = require("modules.concord.component")

return Component("velocity", function(c, x, y)
    c.x = x or 0
    c.y = y or 0
end)
