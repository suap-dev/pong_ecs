local Component = require("modules.concord.component")

return Component("rectangle", function(c, width, height)
    c.width = width or 0
    c.height = height or 0
end)
