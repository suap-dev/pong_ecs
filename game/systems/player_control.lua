local System = require("modules.concord.system")

local system = System({
    pool = { "position", "player" }
})
function system:update(dt)
    for _, e in ipairs(self.pool) do
        if love.keyboard.isDown(e.player.up) and not (e.collides and e.collides.at.top) then
            e:give("velocity", 0, -e.player.base_speed)
        elseif love.keyboard.isDown(e.player.down) and not (e.collides and e.collides.at.bot) then
            e:give("velocity", 0, e.player.base_speed)
        else
            e:remove("velocity")
        end
    end
end

return system
