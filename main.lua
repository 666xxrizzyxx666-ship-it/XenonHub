local MainOptions = {}

function MainOptions.SetWalkSpeed(value)
    local Player = game:GetService("Players").LocalPlayer
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = value
    end
end

function MainOptions.EnableFly(speed)
    -- ton code Fly ici
end

function MainOptions.EnableNoClip()
    -- ton code NoClip ici
end

return MainOptions
