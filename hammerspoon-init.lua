-- Filename: hammerspoon-init.lua
-- Description: Configuration for hammerspoon
-- Author: Andy Holt (andrew.holt@hotmail.co.uk)
-- Date: 2020-06-14 Sun 21:46

-- hello world
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "w",
  function()
  hs.notify.show("Hello World!")
end)

-- move windows around
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.x = f.x - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.y = f.y + 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.y = f.y - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.x = f.x + 10
      win:setFrame(f)
end)

-- Resize window
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "H",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.w = f.w - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "J",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.h = f.h + 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "K",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.h = f.h - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "L",
   function ()
      local win = hs.window.focusedWindow()
      local f = win:frame()

      f.w = f.w + 10
      win:setFrame(f)
end)

-- open hammerspoon console
hs.hotkey.bindSpec({ {"ctrl", "cmd", "alt" }, "y"}, hs.toggleConsole)

-- reload hammerspoon config
hs.hotkey.bindSpec({ {"ctrl", "cmd", "alt" }, "r"}, hs.reload)
