-- check --

local handyState = require "src.handy.handystate"

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
    
    self.handy.frame = 3
end

class.update = function (self, dt)
    if self.curStep == 1 then
        
        if self.tt >= 0.5 then
            self.tt = 0
            
            self.curStep = 2
            self.handy.frame = 4
            
            local item = self.handy:getItemFromHole()
            
            local itemSprite = {}
            
            if item then
                itemSprite.sprite = Asm:get(item.name)
                itemSprite.color = item.color
            else
                itemSprite.sprite = Asm:get("null")
                itemSprite.color = { 1, 1, 1, 1 }
            end
            
            self.handy.itemSprite = itemSprite
        end
        
    elseif self.curStep == 2 then
        
        if self.tt >= 1 then
            self.tt = 0
            
            self.curStep = 3
            return "idle"
        end
        
    end
    
    self.tt = self.tt + dt
end

class.leave = function (self)
    self.handy.moveMode = 1
    self.handy.itemSprite = nil
end

return class
