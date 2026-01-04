-- scene --

local Scene = {}
Scene.__index = Scene

function Scene.new()
    local self = setmetatable({}, Scene)
    
    return self
end

function Scene:arrive()
    
end

function Scene:update(dt)
    
end

function Scene:draw()
    
end

function Scene:leave()
    
end

function Scene:keypressed(key, scancode, isrepeat)
    
end

local SceneManager = {}
local mtSceneManager = { __index=SceneManager }

function SceneManager.new(scenes)
    local self = setmetatable({}, mtSceneManager)
    
    self.scenes = scenes
    self.curScene = nil
    
    return self
end

function SceneManager:update(dt)
    self.curScene:update(dt)
end

function SceneManager:draw()
    self.curScene:draw()
end

function SceneManager:keypressed(key, scancode, isrepeat)
    self.curScene:keypressed(key, scancode, isrepeat)
end

function SceneManager:changeScene(name)
    if self.curScene then self.curScene:leave() end
    self.curScene = self.scenes[name]
    self.curScene:arrive()
end

return {
    scene = Scene,
    sceneManager = SceneManager,
}
