local System = require("modules.concord.system")

local system = System({
    pool = { "position", "velocity" }
})
function system:check_coollisions()

end

return system
