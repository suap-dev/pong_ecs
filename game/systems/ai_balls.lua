local System = require("modules.concord.system")

local system = System({
    pool = { "position", "circle", "velocity" }
})
function system:update(dt)
    for _, e in ipairs(self.pool) do
        if e.collides then
            if e.collides.at.top or e.collides.at.bot then
                e.velocity.y = -e.velocity.y
            end
            if e.collides.at.left or e.collides.at.right then
                e.velocity.x = -e.velocity.x
            end
        end     
    end   
end

return system
