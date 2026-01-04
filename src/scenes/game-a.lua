-- game-a --

local Scene = require("src/scene").scene

local GameA = setmetatable({}, Scene)
GameA.__index = GameA

function GameA.new()
    local self = setmetatable(Scene.new(), GameA)
    
    return self
end

function GameA:arrive()
    print("in game A")
end

function GameA:draw()
    love.graphics.print("press G to start!", 100, 400)
end

function GameA:keypressed(key, scancode, isrepeat)
    if key == 'g' then
        GScene:changeScene("game_b")
    end
end

return GameA
