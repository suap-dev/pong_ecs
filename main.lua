local Concord = require("modules.concord")

local entities = {}

local screen = {}

local systems = {}
local world

function love.load()
    screen.width, screen.height = love.graphics.getDimensions()

    Concord.utils.loadNamespace("components")
    Concord.utils.loadNamespace("systems", systems)
    Concord.utils.loadNamespace("entities", entities)

    world = Concord.world()
    for _, system in pairs(systems) do       
        world:addSystem(system)
    end

    local rocket_width, rocket_height = 15, 80
    local left_rocket = entities.rocket(20, 20, rocket_width, rocket_height, {1,0,0})
    local right_rocket = entities.rocket(screen.width - rocket_width - 20, 20, rocket_width, rocket_height, {0,1,0})

    local ball_radius = 15
    local ball = entities.ball(screen.width/2, screen.height/2, ball_radius, {0,0,1})

    world:addEntity(left_rocket)
    world:addEntity(right_rocket)
    world:addEntity(ball)
end

function love.update(dt)
    world:emit("update", dt)
end

function love.draw()
    world:emit("draw")
end

function love.keypressed(key)
    if key == "r" then
		love.event.quit("restart")
	end
    if key == "q" then
        love.event.quit("exit")
    end
end