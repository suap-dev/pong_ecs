local Component = require("modules.concord.component")

return Component("circle", function(c, radius)
    c.radius = radius or 0
end)
