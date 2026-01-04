-- game-b-after --

local Scene = require("src/scene").scene

local GameBAfter = setmetatable({}, Scene)
GameBAfter.__index = GameBAfter

function GameBAfter.new()
    local self = setmetatable(Scene.new(), GameBAfter)
    
    self.tt = 0
    
    return self
end

function GameBAfter:arrive()
    self.tt = 0
end

function GameBAfter:update(dt)
    self.tt = self.tt + dt
    if self.tt >= 3 then
        GScene:changeScene("game_c")
    end
end

function GameBAfter:draw()
    love.graphics.print("COFFEE, SEA URCHIN, BUG, MONEY, WORM", 233, 300)
end

return GameBAfter
