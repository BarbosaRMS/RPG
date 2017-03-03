tile = {
    x=0;
    y=0;
    width = 48;
    height = 48;
    image;
    focus;
    hover=0;
}
function tile:setX(valX)
    self.x = valX
end
function tile:setY(valY)
    self.y = valY
end
function tile:getX()
    return self.x
end
function tile:getY()
    return self.y
end
function tile:setFocus(state)
    self.focus = state
end
function tile:setHover(state)
    self.hover = state
end
function tile:drawFocus()
    local r,g,b,a = love.graphics.getColor()
    love.graphics.setColor(0,0,255)
    love.graphics.line(self.x,self.y+self.height*0.1,self.x, self.y, self.x + self.width * 0.1, self.y) -- top left
    love.graphics.line(self.x + 0.9*self.width,self.y,self.x+self.width, self.y, self.x + self.width, self.y+self.height*0.1) -- top right
    love.graphics.line(self.x,self.y+self.height*0.9,self.x, self.y+self.height, self.x + self.width * 0.1, self.y+self.height) -- bottom left
    love.graphics.line(self.x + self.width*0.9,self.y+self.height,self.x+self.width, self.y+self.height, self.x + self.width , self.y+self.height*0.9) -- bottom right
    love.graphics.setColor(r,g,b,a)
end
function tile:drawHover()
    local r,g,b,a = love.graphics.getColor()
    love.graphics.setColor(255,0,0)
    love.graphics.line(self.x,self.y+self.height*0.1,self.x, self.y, self.x + self.width * 0.1, self.y) -- top left
    love.graphics.line(self.x + 0.9*self.width,self.y,self.x+self.width, self.y, self.x + self.width, self.y+self.height*0.1) -- top right
    love.graphics.line(self.x,self.y+self.height*0.9,self.x, self.y+self.height, self.x + self.width * 0.1, self.y+self.height) -- bottom left
    love.graphics.line(self.x + self.width*0.9,self.y+self.height,self.x+self.width, self.y+self.height, self.x + self.width , self.y+self.height*0.9) -- bottom right
    love.graphics.setColor(r,g,b,a)
end
function tile:drawbg()
    local r,g,b,a = love.graphics.getColor()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(r,g,b,a)
end
function tile:drawimg()
end
function tile:new(o)
      o = o or {}   -- create object if user does not provide one
      setmetatable(o, self)
      self.__index = self
      return o
end
