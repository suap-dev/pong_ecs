local Component = require("modules.concord.component")

return Component("controlable", function(c, key_up, key_down, base_speed)
    c.up = key_up
    c.down = key_down
    c.base_speed = base_speed
end)
