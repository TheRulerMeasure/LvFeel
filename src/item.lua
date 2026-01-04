-- item --

local draw = function (self)
    self.sprite:drawCenter(1, self.x, self.y)
end

return function (sprite, x, y)
    local self = {}
    
    self.draw = draw
    
    self.x = x or 0
    self.y = y or 0
    
    self.sprite = Asm:get(sprite)
    
    return self
end
