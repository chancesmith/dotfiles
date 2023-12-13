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

-- Open Folders
hs.hotkey.bind(hyper, "s", function ()
  hs.execute("open ~/Dropbox/Screenshots")
end)

hs.hotkey.bind(hyper, "d", function ()
  hs.execute("open ~/Downloads")
end)

-- Open Websites
hs.hotkey.bind(hyper, "g", function ()
  hs.execute("open https://github.com/notifications")
end)

hs.hotkey.bind(hyper, "l", function ()
  local lifewayOneZoom = "https://lifeway.zoom.us/j/99535222109?pwd=OFNnOTRIZi9IR2xyN0wvcjN2R1ZEUT09"
  
  -- copy to clipboard
  hs.pasteboard.setContents(lifewayOneZoom)
  -- open in browser
  hs.execute("open " .. lifewayOneZoom)
end)

hs.hotkey.bind(hyper, "j", function ()
  hs.execute("open https://lifeway.atlassian.net/jira/software/c/projects/DCD/boards/416/timeline?quickFilter=1228&statuses=4%2C2")
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