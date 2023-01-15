local Component = require("modules.concord.component")

return Component("color", function(c, rgb)
    c.rgb = rgb or { 1, 1, 1 }
end)
