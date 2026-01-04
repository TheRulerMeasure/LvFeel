-- game-b --

local Scene = require("src/scene").scene

local GameB = setmetatable({}, Scene)
GameB.__index = GameB

function GameB.new()
    local self = setmetatable(Scene.new(), GameB)
    
    return self
end

function GameB:arrive()
    print("in game B")
end

function GameB:draw()
    love.graphics.print("GAMING", 100, 350)
end

return GameB
