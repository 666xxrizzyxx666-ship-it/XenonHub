-- loader.lua
local MainOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/TON_PSEUDO/XenonHub/main/main.lua"))()
local ViewOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/TON_PSEUDO/XenonHub/main/view.lua"))()
local UtilityOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/TON_PSEUDO/XenonHub/main/utility.lua"))()
local WorldOptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/TON_PSEUDO/XenonHub/main/world.lua"))()

-- Retourner tous les modules dans une seule table
return {
    Main = MainOptions,
    View = ViewOptions,
    Utility = UtilityOptions,
    World = WorldOptions
}
