local Concord = require("modules.concord")

local entities = {}
local systems = {}
local world

function love.load()
    Concord.utils.loadNamespace("game/components")
    Concord.utils.loadNamespace("game/systems", systems)
    Concord.utils.loadNamespace("game/entities", entities)

    world = Concord.world()

    for _, system in pairs(systems) do
        world:addSystem(system)
    end

    for _, entity in pairs(entities) do
        world:addEntity(entity)
    end
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
