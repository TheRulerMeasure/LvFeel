-- handystate --

local smClass = require "src.statemachine"

local class = {}

class.new = function (handy)
    local self = smClass.state.new()
    
    self.tick = class.tick
    
    self.update = class.update
    self.keypressed = class.keypressed
    
    self.handy = handy
    
    return self
end

class.tick = function (self, name, ...)
    if name == "update" then
        return self:update(...)
    elseif name == "keypressed" then
        return self:keypressed(...)
    end
end

class.update = function (self, dt)
    
end

class.keypressed = function (self, key, scancode, isrepeat)
    
end

return class
