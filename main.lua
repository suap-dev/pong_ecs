local Concord = require("modules.concord")

local entities = {}
local systems = {}
local world

require("game.general_controls")

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
    world:emit("ward")
    world:emit("update", dt)
end

function love.draw()
    world:emit("draw")
end
