local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/NexusUI/main/NexusUI-Library-V1.lua", true))()

local window = library:CreateWindow("Game Settings")

-- Adding various elements to the window

window:AddLabel({
    text = "Welcome to Game Settings!",
})

window:AddToggle({
    text = "Enable Music",
    state = true, -- Default state
    callback = function(state)
        print("Music Enabled:", state)
        -- Add logic to enable/disable music based on the state
    end
})

window:AddButton({
    text = "Reset Settings",
    callback = function()
        print("Settings Reset")
        -- Add logic to reset settings to default values
    end
})

window:AddBind({
    text = "Toggle Menu",
    key = Enum.KeyCode.F, -- Default key bind
    hold = true, -- Hold key
    callback = function()
        print("Menu Toggled")
        -- Add logic to toggle the menu
    end
})

window:AddSlider({
    text = "Volume",
    min = 0,
    max = 100,
    value = 50, -- Default volume
    callback = function(value)
        print("Volume set to:", value)
        -- Add logic to set the volume
    end
})

window:AddList({
    text = "Graphics Quality",
    values = {"Low", "Medium", "High"},
    callback = function(value)
        print("Graphics Quality set to:", value)
        -- Add logic to set the graphics quality
    end
})

window:AddBox({
    text = "Player Name",
    value = "Player123", -- Default player name
    callback = function(value)
        print("Player Name set to:", value)
        -- Add logic to set the player name
    end
})

window:AddColor({
    text = "Background Color",
    color = Color3.fromRGB(255, 255, 255), -- Default color
    callback = function(color)
        print("Background Color set to:", color)
        -- Add logic to set the background color
    end
})

local folder = window:AddFolder("Advanced Settings")

folder:AddToggle({
    text = "Show FPS",
    state = false, -- Default state
    callback = function(state)
        print("Show FPS:", state)
        -- Add logic to show/hide FPS
    end
})

folder:AddSlider({
    text = "Mouse Sensitivity",
    min = 1,
    max = 10,
    value = 5, -- Default sensitivity
    callback = function(value)
        print("Mouse Sensitivity set to:", value)
        -- Add logic to set the mouse sensitivity
    end
})

library:Init() -- Initialize the GUI
