local Component = require("modules.concord.component")

return Component("position", function(c, x, y)
    c.x = x or 0
    c.y = y or 0
end)
