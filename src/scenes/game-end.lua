-- game-end --

local Scene = require("src/scene").scene

local GameEnd = setmetatable({}, Scene)
GameEnd.__index = GameEnd

function GameEnd.new()
    local self = setmetatable(Scene.new(), GameEnd)
    
    self.sprites = {
        Asm:get("bug"),
        Asm:get("coffee"),
        Asm:get("frog"),
        Asm:get("money"),
        Asm:get("spikeball"),
        Asm:get("worm"),
    }
    
    return self
end

function GameEnd:arrive()
    
end

function GameEnd:update(dt)
    
end

function GameEnd:draw()
    love.graphics.print("Thank you for playing!", 250, 100)
    
    for i, sp in ipairs(self.sprites) do
        sp:draw(1, 108 + (i-1) * 100, 300)
    end
end

return GameEnd
