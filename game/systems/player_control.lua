local System = require("modules.concord.system")

local player_control = System({
    pool = { "position", "controlable"}
})
function player_control:update(dt)
    for _, e in ipairs(self.pool) do
        if love.keyboard.isDown(e.controlable.up) then
            e:give("velocity", 0, -e.controlable.base_speed)
        elseif love.keyboard.isDown(e.controlable.down) then
            e:give("velocity", 0, e.controlable.base_speed)
        else
            e:remove("velocity")
        end
    end
end

return player_control
