local System = require("modules.concord.system")

local player_control = System({
    pool = { "position", "controlable", "velocity" }
})
function player_control:update(dt)
    for _, e in ipairs(self.pool) do
        if love.keyboard.isDown(e.controlable.up) then
            e.velocity.y = -e.controlable.base_speed
        elseif love.keyboard.isDown(e.controlable.down) then
            e.velocity.y = e.controlable.base_speed
        else
            e.velocity.y = 0
        end
    end
end

return player_control
