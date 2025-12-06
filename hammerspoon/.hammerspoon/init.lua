-- Hammerspoon hotkeys
--   meh   (ctrl+alt+shift): window management + quick links (lighter / transient actions)
--   hyper (ctrl+alt+shift+cmd): app launchers + system actions (heavier / global actions)
-- This mirrors common macOS "meh/hyper" conventions and keeps priority clear:
--   editor -> compiler -> tests -> manual tests -> runtime

local secrets = require("secrets")

local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

-- Pre-downloaded via external script
local spoonInstall = hs.loadSpoon("SpoonInstall")

-- === MEH: Window management ===
-- Move window to the left half of the screen
hs.hotkey.bind(meh, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Move window to the right half of the screen
hs.hotkey.bind(meh, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Full screen
hs.hotkey.bind(meh, "f", function()
  hs.window.focusedWindow():moveToUnit({0, 0, 1, 1})
end)

-- Center window
hs.hotkey.bind(meh, "c", function()
  hs.window.focusedWindow():centerOnScreen()
end)

-- === HYPER: App launcher spoon ===
spoonInstall:andUse("AppLauncher", {
  config = {
    modifiers = hyper
  },
  hotkeys = {
    b = "Brave Browser",
    c = "Claude", -- ai [c]hat
    e = "Visual Studio Code", -- code [e]ditor
    g = "Github Desktop", -- git
    h = "Hyper",
    k = "ghostty",
    m = "Microsoft Outlook", -- [m]ail
    n = "Obsidian", -- notes
    p = "Postman",
    s = "Slack",
    t = "Microsoft Teams",
    x = "Xcode", -- [x]code
    z = "zoom.us"
  }
})

-- === HYPER: Open folders (system actions) ===
hs.hotkey.bind(hyper, "o", function ()
  hs.execute("open ~/Dropbox/Screenshots")
end)

hs.hotkey.bind(hyper, "d", function ()
  hs.execute("open ~/Downloads")
end)

-- === MEH: Quick links (lighter actions) ===
hs.hotkey.bind(meh, "g", function ()
  hs.execute("open https://github.com/notifications")
end)

hs.hotkey.bind(meh, "v", function ()
  hs.execute("open https://vault.prod.lifeway.com/ui/vault/secrets/kv/show/digital-exp-dce/test-accounts/int/lifeway-one")
end)

-- hs.hotkey.bind(meh, "c", function ()
--   hs.execute("open https://chat.openai.com/?model=gpt-4")
-- end)

hs.hotkey.bind(meh, "c", function ()
  hs.execute("open https://outlook.office365.com/calendar/view/workweek")
end)

hs.hotkey.bind(meh, "m", function ()
  hs.execute("open https://mail.google.com/mail/u/0/")
end)

hs.hotkey.bind(meh, "1", function ()
  local secretURL = secrets.ZOOM_LIFEWAY_ONE
  
  if secretURL and secretURL ~= "" then
      hs.urlevent.openURL(secretURL)
  else
      hs.alert.show("No URL found in ZOOM_LIFEWAY_ONE")
  end
end)

hs.hotkey.bind(meh, "2", function ()
  local secretURL = secrets.ZOOM_LIFEWAY_ONE_READER 
  
  if secretURL and secretURL ~= "" then
      hs.urlevent.openURL(secretURL)
  else
      hs.alert.show("No URL found in ZOOM_LIFEWAY_ONE_READER")
  end
end)

hs.hotkey.bind(meh, "j", function ()
  local lw1Jira = "https://lifeway.atlassian.net/jira/software/c/projects/DCD/boards/489?assignee=64170c71af3b93d8ecf2bf15"
  hs.execute("open " .. lw1Jira)
end)

hs.hotkey.bind(meh, "s", function () -- Sentry
  local lw1Jira = "https://lifeway-christian-resources.sentry.io/issues/?environment=production&project=4503902988730368&statsPeriod=14d"
  hs.execute("open " .. lw1Jira)
end)

hs.hotkey.bind(meh, "p", function () -- Perplexity
  hs.execute("open https://www.perplexity.ai/" )
end)

spoonInstall:andUse("ReloadConfiguration", {
  hotkeys = { reloadConfiguration = { hyper, "R" } },
  start = true
})

-- Open apps

hs.hotkey.bind(hyper, "a", function ()
  hs.application.launchOrFocus("Activity Monitor")
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

hs.notify.new({title='Hammerspoon', informativeText='Everything is hawt 🔥'}):send()