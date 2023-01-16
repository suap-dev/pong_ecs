local System = require("modules.concord.system")

local system = System({
    pool = { "position", "circle", "velocity" }
})
function system:update(dt)
    for _, e in ipairs(self.pool) do
        if e.collides then
            if e.collides.at.top and e.velocity.y < 0
                or
                e.collides.at.bot and e.velocity.y > 0
            then
                e.velocity.y = -e.velocity.y
            end

            if e.collides.at.left and e.velocity.x < 0
                or e.collides.at.right and e.velocity.x > 0
            then
                e.velocity.x = -e.velocity.x
            end
        end
    end
end

return system
