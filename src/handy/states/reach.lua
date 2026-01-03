-- reach --

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
    self.handy.frame = 5
end

return class
