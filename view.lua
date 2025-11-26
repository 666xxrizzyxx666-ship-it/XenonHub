local ViewOptions = {}

function ViewOptions.EnableESP()
    local Players = game:GetService("Players")
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChild("ESP_Highlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Parent = player.Character
                highlight.FillColor = Color3.new(1, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
            end
        end
    end
end

function ViewOptions.EnableOutline()
    local RunService = game:GetService("RunService")
    _G.OutlineLines = {}
    _G.OutlineESP = RunService.RenderStepped:Connect(function()
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local screenTop = Vector2.new(Camera.ViewportSize.X / 2, 0)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local headPos = Camera:WorldToViewportPoint(player.Character.Head.Position)
                if not _G.OutlineLines[player] then
                    local line = Drawing.new("Line")
                    line.Color = Color3.new(1, 0, 0)
                    line.Thickness = 2
                    line.Transparency = 1
                    _G.OutlineLines[player] = line
                end
                _G.OutlineLines[player].From = screenTop
                _G.OutlineLines[player].To = Vector2.new(headPos.X, headPos.Y)
                _G.OutlineLines[player].Visible = true
            end
        end
    end)
end

return ViewOptions
