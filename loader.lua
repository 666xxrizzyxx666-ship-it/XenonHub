-- loader.lua
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local MainOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/main.lua"))()
local ViewOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/view.lua"))()
local UtilityOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/utility.lua"))()
local WorldOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/666xxrizzyxx666-ship-it/XenonHub/main/world.lua"))()

return {
    Main = MainOptions,
    View = ViewOptions,
    Utility = UtilityOptions,
    World = WorldOptions
}
