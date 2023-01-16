local Component = require("modules.concord.component")

local players = 0
return Component("player", function(c, key_up, key_down, base_speed, id)
    c.up = key_up or "up"
    c.down = key_down or "down"
    c.base_speed = base_speed or 0
    players = players + 1
    c.id = id or players
end)
