-- Hammerspoon hotkeys
--   meh   (ctrl+alt+shift): quick URL links (light / transient)
--   hyper (ctrl+alt+shift+cmd): app launchers and system actions (heavier / global)
-- Matches common macOS meh/hyper conventions and keeps priority clear:
--   editor -> compiler -> tests -> manual tests -> runtime

local secrets = require("secrets")

local meh = {"shift", "alt", "ctrl"}
local hyper = {"shift", "alt", "ctrl", "cmd"}

-- Pre-downloaded via external script
local spoonInstall = hs.loadSpoon("SpoonInstall")

-- === HYPER: App launcher spoon ===
spoonInstall:andUse("AppLauncher", {
  config = {
    modifiers = hyper
  },
  hotkeys = {
    a = "Activity Monitor",
    b = "Brave Browser",
    c = "Claude", -- ai [c]hat
    e = "Visual Studio Code", -- code [e]ditor
    v = "Visual Studio Code",
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

local mehQuickLinks = {
  { key = "g", url = "https://github.com/notifications" },
  { key = "v", url = "https://vault.prod.lifeway.com/ui/vault/secrets/kv/show/digital-exp-dce/test-accounts/int/lifeway-one" },
  { key = "w", url = "https://outlook.office365.com/calendar/view/workweek" }, -- calendar (moved off meh+c)
  { key = "m", url = "https://mail.google.com/mail/u/0/" },
  { key = "j", url = "https://lifeway.atlassian.net/jira/software/c/projects/DCD/boards/489" }, -- Jira Board
  { key = "t", url = "https://lifeway.atlassian.net/jira/software/c/projects/DCD/boards/489/timeline"}, -- Jira Timeline
  { key = "s", url = "https://lifeway-christian-resources.sentry.io/issues/?environment=production&project=4503902988730368&statsPeriod=14d" }, -- Sentry
  { key = "p", url = "https://www.perplexity.ai/" },
  { key = "k", url = "https://grok.com/" },
  { key = "l", url = "https://claude.ai/" },
  { key = "u", url = "https://www.loom.com/settings/users"},
  { key = "o", url = "https://lifewaychristianresources-my.sharepoint.com/my?csf=1&web=1&e=4L4iF4&id=%2Fpersonal%2Fchance%5Fsmith%5Flifeway%5Fcom%2FDocuments%2FSDM&FolderCTID=0x0120001CC2D9AE130C0C468A19E85185A451BB"}, -- SDM Folder in OneDrive
  { key = "s", url = "https://lifewaychristianresources-my.sharepoint.com/:x:/r/personal/chance_smith_lifeway_com/_layouts/15/Doc.aspx?sourcedoc=%7B7723327B-4E1F-4860-9ECB-A2E8A566656F%7D&file=Chance%20Smith%20employees.xlsx&action=default&mobileredirect=true"} -- Staff sheet
}

for _, link in ipairs(mehQuickLinks) do
  hs.hotkey.bind(meh, link.key, function ()
    hs.execute("open " .. link.url)
  end)
end

-- Secrets-backed Zoom links stay explicit
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

spoonInstall:andUse("ReloadConfiguration", {
  hotkeys = { reloadConfiguration = { hyper, "R" } },
  start = true
})

hs.notify.new({title='Hammerspoon', informativeText='Everything is hawt 🔥'}):send()
