-- using push for virtual resolution
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    retroFont = love.graphics.newFont('retro.ttf', 8)
    love.graphics.setFont(retroFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.printf('Love2d Pong', 0, 20, VIRTUAL_WIDTH, 'center')

    -- first paddle
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    -- second paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 30, 5, 20)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end
