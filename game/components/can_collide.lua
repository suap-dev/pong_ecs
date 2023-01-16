local Component = require("modules.concord.component")

return Component("can_collide", function(c, collision_group)
    c.collision_group = collision_group or 1
end)
