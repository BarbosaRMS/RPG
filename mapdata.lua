require "tiledata"
mapdata = {
    rawdata="";
    data = {};
    __filesize = 0;
    __sizex = 0;
    __sizey = 0;
    tileset=0; --Map index tileset
    quad = {}; --Stores the quad image for draw
    maptiledata = tiledata --Tileset data
}
function mapdata:GetSizeX()
    return self.__sizex
end
function mapdata:GetSizeY()
    return self.__sizey
end
function mapdata:load(filename)
        --[Loads the file and sets variables]
        self.rawdata, self.__filesize = love.filesystem.read(filename)
        self.tileset = string.byte(self.rawdata,1)
        self.maptiledata:loadIndex(self.tileset)
        self.__sizex = string.byte(self.rawdata,2)
        self.__sizey = string.byte(self.rawdata,3)
        self.data = self:__Matrix2d(self.__sizex,self.__sizey)
        k=9 --Sets position for first map tile, bytes before corresponds to map header
        -- Mounts the data table
        for i=1,self.__sizex do
            for j=1,self.__sizey do
                self.data[i][j] = {x=string.byte(self.rawdata,k),y=string.byte(self.rawdata,k+1)}
                k = k + 2
            end
        end
        --[Create the quads]
        self.quad = Matrix2d(self.__sizex,self.__sizey)
        for i=1,self.__sizex do
            for j=1,self.__sizey do
                self.quad[i][j] = love.graphics.newQuad(self.data[i][j].x*self.maptiledata.squaresize,self.data[i][j].y*self.maptiledata.squaresize, self.maptiledata.squaresize, self.maptiledata.squaresize, self.maptiledata.image:getDimensions())
            end
        end
end

function mapdata:DrawMap(x0,y0)
    for i=1,self:GetSizeX() do
        for j=1,self:GetSizeY() do
                love.graphics.draw(self.maptiledata.image,self.quad[i][j],x0 + (j-1)*self.maptiledata.squaresize*self.maptiledata.stretchsize,y0 + (i-1)*self.maptiledata.squaresize*self.maptiledata.stretchsize,0,self.maptiledata.stretchsize,self.maptiledata.stretchsize,0,0,0,0)
        end
    end
end

function mapdata:__Matrix2d(x,y)
    matrix = {}
    for i=1,x do
        matrix[i] = {}
        for j=1,y do
            matrix[i][j] = ""
        end
    end
    return matrix
end
