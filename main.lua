local MainOptions = {}

-- WalkSpeed
function MainOptions.SetWalkSpeed(value)
    local Player = game:GetService("Players").LocalPlayer
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = value
    end
end

-- Fly
function MainOptions.EnableFly(speed)
    local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
    local localplayer = plr
    local torso, pos, gyro
    local keys = {a = false, d = false, w = false, s = false}

    if workspace:FindFirstChild("Core") then
        workspace.Core:Destroy()
    end

    local Core = Instance.new("Part")
    Core.Name = "Core"
    Core.Size = Vector3.new(0.05, 0.05, 0.05)
    Core.Parent = workspace

    local Weld = Instance.new("Weld", Core)
    Weld.Part0 = Core
    Weld.Part1 = localplayer.Character:WaitForChild("LowerTorso")
    Weld.C0 = CFrame.new(0, 0, 0)

    torso = workspace.Core

    pos = Instance.new("BodyPosition", torso)
    gyro = Instance.new("BodyGyro", torso)
    pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
    pos.position = torso.Position
    gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    gyro.cframe = torso.CFrame

    _G.FlyConnection = game:GetService("RunService").Heartbeat:Connect(function()
        local new = gyro.cframe - gyro.cframe.p + pos.position
        if keys.w then new = new + workspace.CurrentCamera.CFrame.LookVector * speed end
        if keys.s then new = new - workspace.CurrentCamera.CFrame.LookVector * speed end
        if keys.d then new = new * CFrame.new(speed, 0, 0) end
        if keys.a then new = new * CFrame.new(-speed, 0, 0) end
        pos.position = new.p
        gyro.cframe = workspace.CurrentCamera.CFrame
    end)

    mouse.KeyDown:Connect(function(key) if keys[key] ~= nil then keys[key] = true end end)
    mouse.KeyUp:Connect(function(key) if keys[key] ~= nil then keys[key] = false end end)
end

-- NoClip
function MainOptions.EnableNoClip()
    local Player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    _G.NoClipConnection = RunService.Stepped:Connect(function()
        local Character = Player.Character
        if Character then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

return MainOptions
