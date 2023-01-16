local module = {}

function module.rect_bounding_box(x, y, width, height)
    return {
        top = y,
        bot = y + height,
        left = x,
        right = x + width
    }
end

function module.circ_bounding_box(x, y, radius)
    return {
        top = y - radius,
        bot = y + radius,
        left = x - radius,
        right = x + radius
    }
end

function module.get_bounding_box(entity)
    return entity.circle and
        module.circ_bounding_box(
            entity.position.x, entity.position.y, entity.circle.radius
        )
        or
        module.rect_bounding_box(
            entity.position.x, entity.position.y, entity.rectangle.width, entity.rectangle.height
        )
end

function module.get_collisions(entity_1, entity_2)
    local box_1 = module.get_bounding_box(entity_1)
    local box_2 = module.get_bounding_box(entity_2)

    return module.overlap(box_1, box_2)
end

--     local collisions_1 = {}
--     local collisions_2 = {}

--     -- local any_collisions = false

--     -- if not module.overlap(box_1, box_2) then return nil
--     -- else return true
--     -- end

--     if box_1.top >= box_2.bot then
--         collisions_1.top = true
--         collisions_2.bot = true
--         -- any_collisions = true
--     end
--     if box_1.bot <= box_2.top then
--         collisions_1.bot = true
--         collisions_2.top = true
--         -- any_collisions = true
--     end
--     if box_1.left >= box_2.right then
--         collisions_1.left = true
--         collisions_2.right = true
--         -- any_collisions = true
--     end
--     if box_1.right <= box_2.left then
--         collisions_1.right = true
--         collisions_2.left = true
--         -- any_collisions = true
--     end

--     -- return any_collisions and { entity_1 = collisions_1, entity_2 = collisions_2 } or nil
--     return true or { entity_1 = collisions_1, entity_2 = collisions_2 }
-- end

function module.overlap(box_1, box_2)
    local d1x = box_2.left - box_1.right
    local d1y = box_2.top - box_1.bot

    local d2x = box_1.left - box_2.right
    local d2y = box_1.top - box_2.bot

    if d1x > 0 or d1y > 0 then
        return false
    end

    if d2x > 0 or d2y > 0 then
        return false
    end

    return true
end

return module
