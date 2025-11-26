local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local MainOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/main.lua"))()
local ViewOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/view.lua"))()
local UtilityOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/utility.lua"))()
local WorldOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/world.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "Xenon",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Merci de patienter",
    ConfigurationSaving = {Enabled = false},
})

local MainTab = Window:CreateTab("MAIN", 4483362458)
local ViewTab = Window:CreateTab("VIEW", 4483362458)
local UtilityTab = Window:CreateTab("UTILITY", 4483362458)
local WorldTab = Window:CreateTab("WORLD", 4483362458)

MainTab:CreateSlider({
    Name = "Vitesse",
    Range = {1, 100},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(v)
        MainOptions.SetWalkSpeed(v)
    end,
})

MainTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(state)
        if state then
            MainOptions.EnableFly(5)
        else
            if _G.FlyConnection then _G.FlyConnection:Disconnect() end
        end
    end,
})

MainTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Callback = function(state)
        if state then
            MainOptions.EnableNoClip()
        else
            if _G.NoClipConnection then _G.NoClipConnection:Disconnect() end
        end
    end,
})

ViewTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(state)
        if state then
            ViewOptions.EnableESP()
        end
    end,
})

ViewTab:CreateToggle({
    Name = "Outline",
    CurrentValue = false,
    Callback = function(state)
        if state then
            ViewOptions.EnableOutline()
        else
            if _G.OutlineESP then _G.OutlineESP:Disconnect() end
        end
    end,
})

UtilityTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(state)
        if state then
            UtilityOptions.InfiniteJump()
        end
    end,
})

UtilityTab:CreateButton({
    Name = "Teleport Tool",
    Callback = function()
        UtilityOptions.TeleportTool()
    end,
})

WorldTab:CreateButton({
    Name = "Night Vision",
    Callback = function()
        WorldOptions.NightVision()
    end,
})

WorldTab:CreateButton({
    Name = "Low Gravity",
    Callback = function()
        WorldOptions.LowGravity()
    end,
})

WorldTab:CreateButton({
    Name = "Normal Gravity",
    Callback = function()
        WorldOptions.NormalGravity()
    end,
})

Rayfield:Notify({
    Title = "Xenon chargé !",
    Content = "Toutes les catégories sont prêtes 🚀",
    Duration = 5,
})
