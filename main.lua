-- main --

local newAsm = require "src.assetmanager"

local newHandy = require "src.handy"
local newHole = require "src.hole"

local aabbOverlap = function (x1, y1, w1, h1, x2, y2, w2, h2)
    return not (x1 > x2+w2 or x1+w1 < x2 or y1 > y2+h2 or y1+h1 < y2)
end

local rectOverlap = function (r1, r2)
    return aabbOverlap(r1.x, r1.y, r1.width, r1.height, r2.x, r2.y, r2.width, r2.height)
end

local handy

local holes = {}

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
    
    love.graphics.setBackgroundColor(0.77, 0.72, 0.73, 1)
    
    handy = newHandy(100, 300)
    
    table.insert(holes, newHole(200, 200))
    table.insert(holes, newHole(300, 250))
end

love.update = function (dt)
    handy:update(dt)
    for i, hole in ipairs(holes) do
        hole:update(dt)
    end
    
    handy.detectingHole = nil
    
    for i, hole in ipairs(holes) do
        if rectOverlap(handy, hole) then
            hole.touching = true
            handy.detectingHole = hole
        else
            hole.touching = false
        end
    end
end

love.draw = function ()
    for i, hole in ipairs(holes) do
        hole:draw()
    end
    
    handy:draw()
end

love.keypressed = function (key, scancode, isrepeat)
    handy:keypressed(key, scancode, isrepeat)
end
