tiledata = {
    image = {};
    squaresize = 32;
    stretchsize = 2;
    maplist = {
        [1]={
        mapfilename="assets/tilea2.png";
        square_size = 32;
        stretch_size=2;}

    };
}

function tiledata:loadIndex(index)
    self.squaresize = self.maplist[index].square_size --Not working.. WHY?!?!
    self.strechsize = self.maplist[index].stretch_size --Not working.. WHY?!?!
    self.image = love.graphics.newImage(self.maplist[index].mapfilename)
end
