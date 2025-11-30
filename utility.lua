local UtilityOptions = {}

function UtilityOptions.InfiniteJump()
    local Player = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")
    UIS.JumpRequest:Connect(function()
        Player.Character:FindFirstChild
