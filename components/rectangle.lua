local Component = require("modules.concord.component")

return Component("rectangle", function (c, width, height)
    c.width = width
    c.height = height
end)