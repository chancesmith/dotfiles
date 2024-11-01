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

hs.hotkey.bind(hyper, "v", function ()
  hs.execute("open https://vault.prod.lifeway.com/ui/vault/secrets/kv/show/digital-exp-dce/test-accounts/int/lifeway-one")
end)

hs.hotkey.bind(hyper, "c", function ()
  hs.execute("open https://chat.openai.com/?model=gpt-4")
end)

hs.hotkey.bind(hyper, "c", function ()
  hs.execute("open https://outlook.office365.com/calendar/view/workweek")
end)

hs.hotkey.bind(hyper, "o", function ()
  hs.execute("open https://outlook.office365.com/mail")
end)

hs.hotkey.bind(hyper, "l", function ()
  local lifewayOneZoom = "https://lifeway.zoom.us/j/99535222109?pwd=OFNnOTRIZi9IR2xyN0wvcjN2R1ZEUT09"
  
  -- copy to clipboard
  hs.pasteboard.setContents(lifewayOneZoom)
  -- open in browser
  hs.execute("open " .. lifewayOneZoom)
end)

hs.hotkey.bind(hyper, "j", function ()
  local lw1Jira = "https://lifeway.atlassian.net/jira/software/c/projects/DCD/boards/416/timeline?statuses=2%2C4"
  hs.execute("open " .. lw1Jira)
end)

hs.hotkey.bind(hyper, "i", function ()
  local lw1Jira = "https://lifeway-christian-resources.sentry.io/issues/?environment=production&project=4503902988730368&statsPeriod=14d"
  hs.execute("open " .. lw1Jira)
end)

spoonInstall:andUse("ReloadConfiguration", {
  hotkeys = { reloadConfiguration = { hyper, "R" } },
  start = true
})

-- Open apps

hs.hotkey.bind(hyper, "a", function ()
  hs.application.launchOrFocus("Activity Monitor")
end)

hs.hotkey.bind(hyper, "z", function ()
  hs.application.launchOrFocus("Zed")
end)

hs.hotkey.bind(hyper, "v", function ()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "h", function ()
  hs.application.launchOrFocus("Hyper")
end)

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

hs.notify.new({title='Hammerspoon', informativeText='Everything is hawt 🔥'}):send()