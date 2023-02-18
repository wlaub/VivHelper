local vivUtil = require('mods').requireFromPlugin('libraries.vivUtil')

local playerPlayback = {}

-- Read from disk instead?
local baseGameTutorials = {
    "combo", "superwalljump", "too_close", "too_far",
    "wavedash", "wavedashppt"
}

playerPlayback.name = "VivHelper/CPP"
playerPlayback.depth = 0
playerPlayback.sprite = function(room,entity)
    local spr = require('structs.drawable_sprite').fromTexture("characters/player_playback/sitDown00")
    local color = entity.Color
    if color == nil or #vivUtil.trim(color) == 0 then color = "ccac3232" end
        
    spr:setColor(vivUtil.getColor(color))
    spr:setPosition(entity.x, entity.y)
    spr:setJustification(0.5,1)
    return spr    
end
playerPlayback.nodeLineRenderType = "line"
playerPlayback.nodeLimits = {0, 2}
playerPlayback.fieldInformation = {
    tutorial = {
        options = baseGameTutorials
    },
    Color = {fieldType = "VivHelper.color", allowXNAColors = true, allowEmpty = true},
    SpeedMultiplier = {fieldType = "number", options = {
        {"2x", 2.0},
        {"1x", 1.0},
        {"0.5x", 0.5},
        {"0.333x", 0.3333333},
        {"0.25x", 0.25},
        {"0.2x", 0.2},
        {"0.1x", 0.1}
    }}
}
playerPlayback.placements = {
    name = "main",
    data = {
        tutorial = "",
        Delay = 1.0,
        StartActive = true,
        SpeedMultiplier = 1.0,
        CustomStringID = "",
        Color = ""
    }
}

return playerPlayback