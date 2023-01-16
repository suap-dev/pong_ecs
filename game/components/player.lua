local Component = require("modules.concord.component")

return Component("player", function(c, key_up, key_down, base_speed)
    c.up = key_up or "up"
    c.down = key_down or "down"
    c.base_speed = base_speed or 0
end)
