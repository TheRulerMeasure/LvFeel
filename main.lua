-- main --

local newAsm = require "src.assetmanager"

local SceneManager = require("src/scene").sceneManager

local GameA = require "src.scenes.game-a"
local GameAAfter = require "src.scenes.game-a-after"
local GameB = require "src.scenes.game-b"
local GameBAfter = require "src.scenes.game-b-after"
local GameC = require "src.scenes.game-c"
local GameCAfter = require "src.scenes.game-c-after"
local GameEnd = require "src.scenes.game-end"

function love.load()
    local font = love.graphics.newImageFont("assets/textures/fontrmsure_sheet.png",
                                            " abcdefghijklmnopqrstuvwxyz" ..
                                            "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
                                            "0123456789`~!@#$%^&*()-_+={[}]|\\:;'\",<>./?")
    love.graphics.setFont(font)
    
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
    
    local bgm = love.audio.newSource("assets/music/whistlehole.wav", "stream")
    bgm:setLooping(true)
    bgm:play()
    
    love.graphics.setBackgroundColor(0.11, 0.1, 0.1, 1)
    
    GScene = SceneManager.new({
        ["game_a"] = GameA.new(),
        ["game_a_after"] = GameAAfter.new(),
        ["game_b"] = GameB.new(),
        ["game_b_after"] = GameBAfter.new(),
        ["game_c"] = GameC.new(),
        ["game_c_after"] = GameCAfter.new(),
        ["game_end"] = GameEnd.new(),
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
