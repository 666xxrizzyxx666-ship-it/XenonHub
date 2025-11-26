local UtilityOptions = {}

function UtilityOptions.InfiniteJump(state)
    local Player = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")

    if state then
        _G.InfiniteJumpConn = UIS.JumpRequest:Connect(function()
            Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    else
        if _G.InfiniteJumpConn then _G.InfiniteJumpConn:Disconnect() _G.InfiniteJumpConn = nil end
    end
end

function UtilityOptions.TeleportTool(state)
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()

    if state then
        _G.TeleportConn = Mouse.Button1Down:Connect(function()
            if Mouse.Target then
                Player.Character:MoveTo(Mouse.Hit.p)
            end
        end)
    else
        if _G.TeleportConn then _G.TeleportConn:Disconnect() _G.TeleportConn = nil end
    end
end

return UtilityOptions
