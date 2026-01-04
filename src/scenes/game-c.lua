-- game-c --

local math2 = require "src.math2"

local Scene = require("src/scene").scene

local newHoleGame = require "src.holegame"

local newHandy = require "src.handy"
local newHole = require "src.hole"

-- Handy
-- Holes
-- HoleGame

local function tooClose(x, y, positions)
    for i, pos in ipairs(positions) do
        if math2.dist2(x, y, pos.x, pos.y) < 6100 then
            return true
        end
    end
    return false
end

local GameC = setmetatable({}, Scene)
GameC.__index = GameC

function GameC.new()
    local self = setmetatable(Scene.new(), GameC)
    
    return self
end

function GameC:arrive()
    local items = {
        { name = "coffee", color = {0.88, 0.77, 0.22, 1} },
        { name = "spikeball", color = {1, 1, 1, 1} },
        { name = "bug", color = {0.75, 0.58, 0.89, 1} },
        { name = "money", color = {0.5, 0.7, 0.75, 1} },
        { name = "worm", color = {0.8, 0.5, 0.75, 1} },
        { name = "frog", color = {0.8, 0.5, 0.75, 1} },
    }
    
    HoleGame = newHoleGame(#items, "game_c_after")
    
    Handy = newHandy(400, 300)
    
    Holes = {}
    
    local positions = {}
    
    for i = 1, #items do
        local x = love.math.random() * 500 + 100
        local y = love.math.random() * 300 + 100
        while tooClose(x, y, positions) do
            x = love.math.random() * 500 + 100
            y = love.math.random() * 300 + 100
        end
        table.insert(positions, { x=x, y=y })
        table.insert(Holes, newHole(x, y, items[i].name, items[i].color))
    end
end

function GameC:update(dt)
    
    HoleGame:update(dt)
    
    Handy:update(dt)
    for i, hole in ipairs(Holes) do
        hole:update(dt)
    end
    
    Handy.detectingHole = nil
    
    for i, hole in ipairs(Holes) do
        if math2.rectOverlap(Handy, hole) then
            hole.touching = true
            Handy.detectingHole = hole
        else
            hole.touching = false
        end
    end
end

function GameC:draw()
    for i, hole in ipairs(Holes) do
        hole:draw()
    end
    
    Handy:draw()
end

function GameC:leave()
    Handy = nil
    Holes = nil
    HoleGame = nil
end

function GameC:keypressed(key, scancode, isrepeat)
    Handy:keypressed(key, scancode, isrepeat)
end

return GameC
