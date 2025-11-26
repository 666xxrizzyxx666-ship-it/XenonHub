local UtilityOptions = {}

-- Infinite Jump
function UtilityOptions.InfiniteJump()
    local Player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    UserInputService.JumpRequest:Connect(function()
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end

-- Teleport Tool
function UtilityOptions.TeleportTool()
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    Mouse.Button1Down:Connect(function()
        if Mouse.Target then
            Player.Character:MoveTo(Mouse.Hit.p)
        end
    end)
end

return UtilityOptions
