local Component = require("modules.concord.component")

return Component("collides", function(c, collisions)
    c.at = {
        top = collisions.top or false,
        bot = collisions.bot or false,
        left = collisions.left or false,
        right = collisions.right or false
    }
end)
