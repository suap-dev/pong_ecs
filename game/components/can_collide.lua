local Component = require("modules.concord.component")

return Component("can_collide", function(c, collision_groups)
    c.collision_grous = collision_groups or {1}
end)
