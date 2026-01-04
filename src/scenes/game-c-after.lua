-- game-c-after --

local Scene = require("src/scene").scene

local GameCAfter = setmetatable({}, Scene)
GameCAfter.__index = GameCAfter

function GameCAfter.new()
    local self = setmetatable(Scene.new(), GameCAfter)
    
    self.tt = 0
    
    return self
end

function GameCAfter:arrive()
    self.tt = 0
end

function GameCAfter:update(dt)
    self.tt = self.tt + dt
    if self.tt >= 3 then
        GScene:changeScene("game_end")
    end
end

function GameCAfter:draw()
    love.graphics.print("COFFEE, SEA URCHIN, FROG, BUG, MONEY, WORM", 220, 300)
end

return GameCAfter
