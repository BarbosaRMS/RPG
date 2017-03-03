require "utils"
require "mapdata" --[[Map Object]]

map1 = mapdata;
function love.load()
    map1:load("mapdata/map1.txtmap")
end
function love.draw()
  map1:DrawMap(0,0)
end
function love.update()

end
