-- assetmanager --

local newSp = require "src.spritesheet"

local spConfig = {
    hframes = 1,
    vframes = 1,
    settings = nil,
}

local manager = {}
local mt = { __index=manager }

function manager:add(name, asset)
    assert(not self.assets[name], "An asset already exist!")
    self.assets[name] = asset
end

function manager:get(name)
    return self.assets[name]
end

function manager:addSprite(name, filepath, config)
    
    local conf = config or spConfig
    
    local sp = newSp(filepath,
                        conf.hframes or spConfig.hframes,
                        conf.vframes or spConfig.vframes,
                        conf.settings)
    self:add(name, sp)
end

return function ()
    return setmetatable({
        
        assets = {},
        
    }, mt)
end
