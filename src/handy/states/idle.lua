-- idle --

local handyState = require "src.handy.handystate"

local class = {}

class.new = function (handy)
    local self = handyState.new(handy)
    
    self.arrive = class.arrive
    self.update = class.update
    
    return self
end

class.arrive = function (self)
    
end

class.update = function (self, dt)
    if (self.handy.motionX ~= 0) or (self.handy.motionY ~= 0) then
        return "move"
    end
    
    self.handy.frame = 1
end

return class
