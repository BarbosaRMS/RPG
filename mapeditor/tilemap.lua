require "tile"

tilemap = {
    tiles = {};
    __numTilesX = 10;
    __numTilesY = 10;
    map_x0 = 0;
    map_y0 = 0;
}

function tilemap:init(x0,y0)
    self.map_x0 = x0
    self.map_y0 = y0
    self.tiles = Matrix2d(self.__numTilesX,self.__numTilesY)
    for i=1,self.__numTilesX do
        for j=1,self.__numTilesY do
            self.tiles[i][j] = tile:new()
            self.tiles[i][j]:setX(self.map_x0 + (i-1) * self.tiles[i][j].width)
            self.tiles[i][j]:setY(self.map_y0 + (j-1) * self.tiles[i][j].height)
        end
    end
end

function tilemap:CheckHover()
    local MouseX = love.mouse.getX()
    local MouseY = love.mouse.getY()
    for i=1,self.__numTilesX do
        for j=1,self.__numTilesY do
            self.tiles[i][j]:setHover(0)
            if MouseX > self.tiles[i][j]:getX() and MouseX <= self.tiles[i][j]:getX() + self.tiles[i][j].width then
                if MouseY > self.tiles[i][j]:getY() and MouseY <= self.tiles[i][j]:getY() + self.tiles[i][j].height then
                    self.tiles[i][j]:setHover(1)
                end
            end
        end
    end
end
function tilemap:CheckClick()
    local MouseX = love.mouse.getX()
    local MouseY = love.mouse.getY()
    if love.mouse.isDown(1) then
        for i=1,self.__numTilesX do
            for j=1,self.__numTilesY do
                if self.tiles[i][j].focus == 0 then
                    if MouseX > self.tiles[i][j]:getX() and MouseX < self.tiles[i][j]:getX() + self.tiles[i][j].width then
                        if MouseY > self.tiles[i][j]:getY() and MouseY < self.tiles[i][j]:getY() + self.tiles[i][j].height then
                            self.tiles[i][j]:setFocus(1)
                        end
                    end
                else
                    self.tiles[i][j]:setFocus(0)
                end
            end
        end
    end
end
function tilemap:draw()
    love.graphics.setColor(255, 0, 0)
    for i=1,self.__numTilesX do
        for j=1,self.__numTilesY do
            self.tiles[i][j]:drawbg()
            self.tiles[i][j]:drawimg()
            if self.tiles[i][j].hover == 1 then
                self.tiles[i][j]:drawHover()
            end
            if self.tiles[i][j].focus == 1 then
                self.tiles[i][j]:drawFocus()
            end
        end
    end
end
function tilemap:new (o)
      o = o or {}   -- create object if user does not provide one
      setmetatable(o, self)
      self.__index = self
      return o
    end

function tilemap:setMapX0(x0)
    self.map_x0 = x0
end
function tilemap:setMapY0(y0)
    self.map_y0 = y0
end
function tilemap:getMapX0()
    return self.map_x0
end
function tilemap:getMapY0()
    return self.map_y0
end
