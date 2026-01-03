-- statemachine --


local state = {}

state.new = function ()
    local self = {}
    
    self.arrive = state.arrive
    self.tick = state.tick
    self.leave = state.tick
    
    return self
end

state.arrive = function (self, prevState)
    
end

state.tick = function (self, name, ...)
    
end

state.leave = function (self)
    
end


local statemachine = {}

statemachine.new = function ()
    local self = {}
    
    self.tick = statemachine.tick
    self.changeState = statemachine.changeState
    self.addState = statemachine.addState
    self.setInitialState = statemachine.setInitialState
    
    self.states = {}
    self.curState = nil
    self.curStateKey = nil
    
    return self
end

statemachine.tick = function (self, name, ...)
    local key = self.curState:tick(name, ...)
    if key then
        self:changeState(key)
    end
end

statemachine.changeState = function (self, key)
    self.curState:leave()
    self.curState = self.states[key]
    self.curState:arrive(self.curStateKey)
    self.curStateKey = key
    
    --[[
    while key2 do
        prevKey = key2
        self.curState:leave()
        self.curState = self.states[key2]
        local key2 = self.curState:arrive(self.curStateKey)
        self.curStateKey = prevKey
    end
    ]]
end

statemachine.addState = function (self, key, newState)
    assert(not self.states[key], "State " .. key .. " is already exist!")
    self.states[key] = newState
end

statemachine.setInitialState = function (self, key)
    self.curStateKey = key
    self.curState = self.states[self.curStateKey]
    self.curState:arrive()
end


return {
    state = state,
    statemachine = statemachine,
}
