-- handy --

local smClass = require "src.statemachine"

local pathToStates = "src/handy/states/"

local states = {
    idle = require(pathToStates .. "idle"),
    move = require(pathToStates .. "move"),
    reach = require(pathToStates .. "reach"),
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
    
    self.x = self.x + self.motionX * 100 * dt
    self.y = self.y + self.motionY * 100 * dt
    
    self.sm:tick("update", dt)
end

local draw = function (self)
    self.sprite:drawCenter(self.frame, self.x + 20, self.y + 40)
    
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return function (x, y)
    
    local inst = {}
    
    inst.update = update
    inst.draw = draw
    
    inst.x = x or 0
    inst.y = y or 0
    inst.width = 50
    inst.height = 50
    
    inst.motionX = 0
    inst.motionY = 0
    
    inst.sprite = Asm:get("hand_sheet")
    
    inst.frame = 1
    
    inst.sm = smClass.statemachine.new()
    
    
    
    for k, class in pairs(states) do
        inst.sm:addState(k, class.new(inst))
    end
    
    inst.sm:setInitialState("idle")
    
    return inst
end
