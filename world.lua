local WorldOptions = {}

-- Night Vision
function WorldOptions.NightVision()
    game.Lighting.Brightness = 2
    game.Lighting.Ambient = Color3.new(1,1,1)
end

-- Low Gravity
function WorldOptions.LowGravity()
    workspace.Gravity = 50
end

-- Normal Gravity
function WorldOptions.NormalGravity()
    workspace.Gravity = 196.2
end

return WorldOptions
