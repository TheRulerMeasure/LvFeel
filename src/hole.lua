-- hole --

local update = function (self, dt)
    
    self.animTime = self.animTime + 2.5 * dt
    
    self.frame = (math.floor(self.animTime) % 2) + 1
end

local draw = function (self)
    
    self.sprite:drawCenter(self.frame, self.x + 16, self.y + 16)
    
    --[[
    if self.touching then
        love.graphics.setColor(0, 1, 0, 1)
    else
        love.graphics.setColor(1, 0, 0, 1)
    end
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1 ,1)
    ]]
end

local popItem = function (self)
    local item = self.item
    
    if item then
        HoleGame:foundItem()
    end
    
    self.item = nil
    
    return item
end

return function (x, y, itemName, itemColor) return {
    
    x = x or 0,
    y = y or 0,
    
    width = 30,
    height = 30,
    
    frame = 1,
    
    item = {
        name = itemName or "money",
        color = itemColor or { 0.5, 1, 0.75, 1 },
    },
    
    animTime = love.math.random() * 10,
    
    sprite = Asm:get("hole_sheet"),
    
    touching = false,
    
    update = update,
    draw = draw,
    popItem = popItem,
}
end
