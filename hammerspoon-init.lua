-- Filename: hammerspoon-init.lua
-- Description: Configuration for hammerspoon
-- Author: Andy Holt (andrew.holt@hotmail.co.uk)
-- Date: 2020-06-14 Sun 21:46

-- hello world
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "w",
   function()
     hs.notify.show("Hello World!", "Welcome to Hammerspoon", "")
   end)

-- move window to the left
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.x = f.x - 10
      win:setFrame(f)
end)

-- open hammerspoon console
hs.hotkey.bindSpec({ {"ctrl", "cmd", "alt" }, "y"}, hs.toggleConsole)

-- reload hammerspoon config
hs.hotkey.bindSpec({ {"ctrl", "cmd", "alt" }, "r"}, hs.reload)
