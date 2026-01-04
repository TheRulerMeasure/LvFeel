-- move --

local handyState = require "src.handy.handystate"

local class = {}

class.new = function (handy)
    local self = handyState.new(handy)
    
    self.arrive = class.arrive
    self.update = class.update
    self.keypressed = class.keypressed
    
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

class.keypressed = function (self, key, scancode, isrepeat)
    if (key == 'z' or key == "space" or key == "return") and self.handy.detectingHole then
        local hole = self.handy.detectingHole
        self.handy.x = hole.x - 5
        self.handy.y = hole.y - 5
        return "reach"
    end
end

return class
