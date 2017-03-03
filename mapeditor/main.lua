require "utils"
require "tilemap"

tilemap0 = tilemap:new()
function love.load()
    tilemap0:init(50,25)
    love.graphics.setBackgroundColor(39,40,34)
end

function love.draw()
    local MouseX = love.mouse.getX()
    local MouseY = love.mouse.getY()
    love.graphics.print(MouseX .. "," .. MouseY)
    tilemap0:draw()
end

function love.update(dt)
    --[[Mouse Events]]
    tilemap0:CheckHover()
    tilemap0:CheckClick()
end
