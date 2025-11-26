-- Charger Rayfield (UI)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Charger les modules depuis ton repo
local MainOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/main.lua"))()
local ViewOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/view.lua"))()
local UtilityOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/utility.lua"))()
local WorldOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/world.lua"))()

-- Créer la fenêtre Xenon
local Window = Rayfield:CreateWindow({
    Name = "Xenon",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Modules GitHub",
    ConfigurationSaving = {Enabled = false},
})

-- Onglets
local MainTab = Window:CreateTab("MAIN", 4483362458)
local ViewTab = Window:CreateTab("VIEW", 4483362458)
local UtilityTab = Window:CreateTab("UTILITY", 4483362458)
local WorldTab = Window:CreateTab("WORLD", 4483362458)

-- MAIN
MainTab:CreateSlider({
    Name = "Vitesse",
    Range = {1, 100},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(v) MainOptions.SetWalkSpeed(v) end,
})
MainTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(s) MainOptions.EnableFly(s, 5) end,
})
MainTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Callback = function(s) if s then MainOptions.EnableNoClip() else if _G.NoClipConnection then _G.NoClipConnection:Disconnect() end end end,
})

-- VIEW
ViewTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(s) ViewOptions.EnableESP(s) end,
})
ViewTab:CreateToggle({
    Name = "Outline",
    CurrentValue = false,
    Callback = function(s) ViewOptions.EnableOutline(s) end,
})

-- UTILITY
UtilityTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(s) UtilityOptions.InfiniteJump(s) end,
})
UtilityTab:CreateToggle({
    Name = "Teleport Tool",
    CurrentValue = false,
    Callback = function(s) UtilityOptions.TeleportTool(s) end,
})

-- WORLD
WorldTab:CreateButton({
    Name = "Night Vision",
    Callback = function() WorldOptions.NightVision() end,
})
WorldTab:CreateButton({
    Name = "Low Gravity",
    Callback = function() WorldOptions.LowGravity() end,
})
WorldTab:CreateButton({
    Name = "Normal Gravity",
    Callback = function() WorldOptions.NormalGravity() end,
})

Rayfield:Notify({
    Title = "Xenon chargé",
    Content = "Rayfield + modules (MAIN, VIEW, UTILITY, WORLD) prêts 🚀",
    Duration = 5,
})
