local Component = require("modules.concord.component")

return Component("position", function (c, x, y)
    c.x = x
    c.y = y    
end)