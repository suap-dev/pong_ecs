local Component = require("modules.concord.component")

return Component("color", function(c, rgb)
    c.rgb = rgb
end)
