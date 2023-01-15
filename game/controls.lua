function love.keypressed(key)
    if key == "r" then
        love.event.quit("restart")
    end
    if key == "q" then
        love.event.quit("exit")
    end
end
