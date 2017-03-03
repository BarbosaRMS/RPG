g = love.graphics
function love.load()
    image = love.graphics.newImage("assets/tilea2.png")
end
function love.draw()
  drawmap(0,0)
end
function love.update()

end
function drawmap(x0,y0)
    pos_x = 12
    pos_y = 9
    squaresize = 32
    quad = love.graphics.newQuad(pos_x*squaresize,pos_y*squaresize, squaresize, squaresize, image:getDimensions())
    love.graphics.draw(image,quad,300,300,math.rad(45),2,2,0,0,0,1)
end
