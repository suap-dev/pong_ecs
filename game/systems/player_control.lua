local System = require("modules.concord.system")

local system = System({
    pool = { "position", "controlable"}
})
function system:update(dt)
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

return system
