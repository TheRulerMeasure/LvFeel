-- move --

local handyState = require "src.handy.handystate"

local class = {}

class.new = function (handy)
    local self = handyState.new(handy)
    
    self.arrive = class.arrive
    self.update = class.update
    
    self.tt = 0
    
    return self
end

class.arrive = function (self)
    
end

class.update = function (self, dt)
    if (self.handy.motionX == 0) and (self.handy.motionY == 0) then
        return "idle"
    end
    
    self.tt = self.tt + 10 * dt
    local frame = (math.floor(self.tt) % 2) + 1
    self.handy.frame = frame
end

return class
