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
    
    self.newScene = nil
    
    return self
end

function SceneManager:update(dt)
    if self.curScene then
        self.curScene:update(dt)
    end
    
    self:transitScene()
end

function SceneManager:draw()
    if self.curScene then
        self.curScene:draw()
    end
end

function SceneManager:keypressed(key, scancode, isrepeat)
    if self.curScene then
        self.curScene:keypressed(key, scancode, isrepeat)
    end
end

function SceneManager:transitScene()
    if not self.newScene then
        return
    end
    
    if self.curScene then
        self.curScene:leave()
    end
    self.curScene = self.scenes[self.newScene]
    self.newScene = nil
    self.curScene:arrive()
end

function SceneManager:changeScene(name)
    self.newScene = name
end

return {
    scene = Scene,
    sceneManager = SceneManager,
}
