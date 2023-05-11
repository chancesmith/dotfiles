local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

-- Pre-downloaded via external script
local spoonInstall = hs.loadSpoon("SpoonInstall")

spoonInstall:andUse("AppLauncher", {
  config = {
    modifiers = meh
  },
  hotkeys = {
    b = "Brave Browser",
    c = "Visual Studio Code",
    g = "Github Desktop", -- git
    h = "Hyper",
    m = "Superhuman", -- mail
    n = "Obsidian", -- notes
    p = "Postman",
    s = "Slack",
    t = "Microsoft Teams",
    z = "zoom.us"
  }
})

hs.hotkey.bind(hyper, "g", function ()
  hs.execute("open https://github.com/notifications")
end)    

spoonInstall:andUse("ReloadConfiguration", {
  hotkeys = { reloadConfiguration = { hyper, "R" } },
  start = true
})

-- Sound Pad
hs.hotkey.bind(hyper, "6", function ()
  hs.alert.show("Womp Womp")
  hs.sound.getByFile("./sounds/womp-womp.mp3"):play()
  hs.sound.getByFile("./sounds/womp-womp.mp3"):device(nil):play()  -- WIP: trying to play so others can here the sound
end)

-- Emojis
hs.hotkey.bind(hyper, "e", function ()
  hs.eventtap.keyStroke({"ctrl", "cmd"}, "space")
end)

-- Mic Mute
spoon.SpoonInstall:andUse("MicMute")
spoon.MicMute:bindHotkeys({toggle = {hyper, "m"}}, 1)

-- Window Manager
spoon.SpoonInstall:andUse("MiroWindowsManager")
hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})

function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], false, true)
  end
end

hs.hotkey.bind(hyper, "1", moveWindowToDisplay(1))
hs.hotkey.bind(hyper, "2", moveWindowToDisplay(2))
hs.hotkey.bind(hyper, "3", moveWindowToDisplay(3))

hs.notify.new({title='Hammerspoon', informativeText='Everything is hawt 🔥'}):send()