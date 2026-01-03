-- reach --

local handyState = require "src.handy.handystate"

local STEP_TIME1 = 0.5
local STEP_TIME2 = 1

local class = {}

class.new = function (handy)
    local self = handyState.new(handy)
    
    self.arrive = class.arrive
    self.update = class.update
    self.leave = class.leave
    
    self.tt = 0
    
    self.curStep = 1
    
    return self
end

class.arrive = function (self)
    self.curStep = 1
    
    self.handy.moveMode = 2
    
    self.handy.frame = 5
    self.handy.spOffsetY = 20
end

class.update = function (self, dt)
    
    if self.curStep == 1 then
        
        if self.tt >= STEP_TIME1 then
            self.tt = 0
            
            self.curStep = 2
            self.handy.frame = 6
            self.handy.spOffsetY = -5
        end
        
    elseif self.curStep == 2 then
        
        if self.tt >= STEP_TIME2 then
            self.tt = 0
            
            self.curStep = 3
            return "idle"
        end
        
    end
    
    self.tt = self.tt + dt
end

class.leave = function (self)
    self.handy.moveMode = 1
    self.handy.spOffsetY = 40
end

return class
