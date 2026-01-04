-- main --

--[[
local newAsm = require "src.assetmanager"

local newHandy = require "src.handy"
local newHole = require "src.hole"

-- Asm
-- Handy
-- Holes

local aabbOverlap = function (x1, y1, w1, h1, x2, y2, w2, h2)
    return not (x1 > x2+w2 or x1+w1 < x2 or y1 > y2+h2 or y1+h1 < y2)
end

local rectOverlap = function (r1, r2)
    return aabbOverlap(r1.x, r1.y, r1.width, r1.height, r2.x, r2.y, r2.width, r2.height)
end

love.load = function ()
    
    Asm = newAsm()
    Asm:addSprite("hand_sheet", "assets/textures/hand_sheet2.png", {
        hframes = 6,
        vframes = 1,
    })
    Asm:addSprite("hole_sheet", "assets/textures/hole_sheet.png", {
        hframes = 2,
        vframes = 1,
    })
    Asm:addSprite("null", "assets/textures/null.png")
    Asm:addSprite("bug", "assets/textures/bug.png")
    Asm:addSprite("coffee", "assets/textures/coffee.png")
    Asm:addSprite("frog", "assets/textures/frog.png")
    Asm:addSprite("money", "assets/textures/money.png")
    Asm:addSprite("spikeball", "assets/textures/spikeball.png")
    Asm:addSprite("worm", "assets/textures/worm.png")
    
    love.graphics.setBackgroundColor(0.77, 0.72, 0.73, 1)
    
    Handy = newHandy(100, 300)
    
    Holes = {}
    
    table.insert(Holes, newHole(200, 200))
    table.insert(Holes, newHole(300, 250))
end

love.update = function (dt)
    Handy:update(dt)
    for i, hole in ipairs(Holes) do
        hole:update(dt)
    end
    
    Handy.detectingHole = nil
    
    for i, hole in ipairs(Holes) do
        if rectOverlap(Handy, hole) then
            hole.touching = true
            Handy.detectingHole = hole
        else
            hole.touching = false
        end
    end
end

love.draw = function ()
    for i, hole in ipairs(Holes) do
        hole:draw()
    end
    
    Handy:draw()
end

love.keypressed = function (key, scancode, isrepeat)
    Handy:keypressed(key, scancode, isrepeat)
end
]]

local GameA = require "src.scenes.game-a"
local GameB = require "src.scenes.game-b"
local SceneManager = require("src/scene").sceneManager

function love.load()
    GScene = SceneManager.new({
        ["game_a"] = GameA.new(),
        ["game_b"] = GameB.new(),
    })
    
    GScene:changeScene("game_a")
end

function love.update(dt)
    GScene:update(dt)
end

function love.draw()
    GScene:draw()
end

function love.keypressed(key, scancode, isrepeat)
    GScene:keypressed(key, scancode, isrepeat)
end
