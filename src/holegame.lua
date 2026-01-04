-- holegame --

local update = function (self, dt)
    if self.foundCount >= self.maxFoundCount then
        self.nextLevelDelay = self.nextLevelDelay + dt
        if self.nextLevelDelay >= 3 then
            GScene:changeScene(self.nextLevel)
        end
    end
end

local foundItem = function (self)
    self.foundCount = self.foundCount + 1
end

return function (maxCount, nextLevel)
    local self = {}
    
    self.update = update
    self.foundItem = foundItem
    
    self.maxFoundCount = maxCount or 100000
    
    self.nextLevel = nextLevel
    
    self.foundCount = 0
    self.nextLevelDelay = 0
    
    return self
end
