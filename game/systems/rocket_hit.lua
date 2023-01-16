local System = require("modules.concord.system")

-- TODO: make a proper collision system?
local system = System({
    balls = { "circle", "ai", "position", "velocity" },
    rockets = { "rectangle", "player", "position" }
})
function system:play()
    for _, ball in ipairs(self.balls) do
        for _, rocket in ipairs(self.rockets) do
            if rocket.player.id == "left"
                and ball.velocity.x < 0
                and rocket.position.y <= ball.position.y
                and ball.position.y <= rocket.position.y + rocket.rectangle.height
                and ball.position.x - ball.circle.radius <= rocket.position.x + rocket.rectangle.width
            then
                ball.velocity.x = -ball.velocity.x
            elseif rocket.player.id == "right"
                and ball.velocity.x > 0
                and rocket.position.y <= ball.position.y
                and ball.position.y <= rocket.position.y + rocket.rectangle.height
                and rocket.position.x <= ball.position.x + ball.circle.radius
            then
                ball.velocity.x = -ball.velocity.x
            end
        end
    end
end

return system
