-- game-a-after --

local Scene = require("src/scene").scene

local GameAAfter = setmetatable({}, Scene)
GameAAfter.__index = GameAAfter

function GameAAfter.new()
    local self = setmetatable(Scene.new(), GameAAfter)
    
    self.tt = 0
    
    return self
end

function GameAAfter:arrive()
    self.tt = 0
end

function GameAAfter:update(dt)
    self.tt = self.tt + dt
    if self.tt >= 3 then
        GScene:changeScene("game_b")
    end
end

function GameAAfter:draw()
    love.graphics.print("FROG, WORM, MONEY", 300, 300)
end

return GameAAfter
