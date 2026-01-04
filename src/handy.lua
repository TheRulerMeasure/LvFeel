-- handy --

local smClass = require "src.statemachine"

local pathToStates = "src/handy/states/"

local states = {
    idle = require(pathToStates .. "idle"),
    move = require(pathToStates .. "move"),
    reach = require(pathToStates .. "reach"),
    check = require(pathToStates .. "check")
}

local update = function (self, dt)
    if love.keyboard.isDown("right") then
        self.motionX = 1
    elseif love.keyboard.isDown("left") then
        self.motionX = -1
    else
        self.motionX = 0
    end
    
    if love.keyboard.isDown("down") then
        self.motionY = 1
    elseif love.keyboard.isDown("up") then
        self.motionY = -1
    else
        self.motionY = 0
    end
    
    if self.moveMode == 1 then
        self.x = self.x + self.motionX * 100 * dt
        self.y = self.y + self.motionY * 100 * dt
    end
    
    self.sm:tick("update", dt)
end

local draw = function (self)
    self.sprite:drawCenter(self.frame,
                            self.x + self.spOffsetX,
                            self.y + self.spOffsetY)
    
    if self.itemSprite then
        love.graphics.setColor(self.itemSprite.color)
        self.itemSprite.sprite:drawCenter(1,
                                            self.x + self.spOffsetX,
                                            self.y + self.spOffsetY - 20)
        love.graphics.setColor(1, 1, 1, 1)
    end
    
    -- love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

local keypressed = function (self, key, scancode, isrepeat)
    self.sm:tick("keypressed", key, scancode, isrepeat)
end

local getItemFromHole = function (self)
    return self.detectingHole:popItem()
end

return function (x, y)
    
    local inst = {}
    
    inst.update = update
    inst.draw = draw
    inst.keypressed = keypressed
    inst.getItemFromHole = getItemFromHole
    
    inst.x = x or 0
    inst.y = y or 0
    inst.width = 50
    inst.height = 50
    
    inst.spOffsetX = 20
    inst.spOffsetY = 40
    
    inst.motionX = 0
    inst.motionY = 0
    
    inst.sprite = Asm:get("hand_sheet")
    
    inst.itemSprite = nil
    
    inst.frame = 1
    
    inst.moveMode = 1
    
    inst.detectingHole = nil
    
    inst.sm = smClass.statemachine.new()
    
    
    for k, class in pairs(states) do
        inst.sm:addState(k, class.new(inst))
    end
    
    inst.sm:setInitialState("idle")
    
    return inst
end
