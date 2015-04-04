local alert = require 'hs.alert'
local mash = {"cmd", "alt", "ctrl"}
local nudge = {"cmd", "ctrl"}
local fold = {"cmd", "alt"}


function frame ()
  local win = hs.window.focusedWindow()
  return win:screen():frame()
end

function setFrame (frameSpec)
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = frameSpec.x
  f.y = frameSpec.y
  f.w = frameSpec.w
  f.h = frameSpec.h
  win:setFrame(f)
end

local maxFrame =  frame()
local maxFrameSpec =  {x=maxFrame.x, y=maxFrame.y, w=maxFrame.w, h=maxFrame.h}
local rightHalfFrameSpec = {x=maxFrame.x+maxFrame.w/2, y=maxFrame.y, w=maxFrame.w/2, h=maxFrame.h}
local leftHalfFrameSpec =  {x=maxFrame.x, y=maxFrame.y, w=maxFrame.w/2, h=maxFrame.h}
local topHalfFrameSpec = {x=maxFrame.x, y=maxFrame.y, w=maxFrame.w, h=maxFrame.h/2}
local bottomHalfFrameSpec = {x=maxFrame.x, y=maxFrame.y+maxFrame.h/2, w=maxFrame.w, h=maxFrame.h/2}


function mashTo (key, exec)
  hs.hotkey.bind(mash, key, exec)
end

function nudgeTo (key, exec)
  hs.hotkey.bind(nudge, key, exec)
end

hs.hotkey.bind(fold, "/", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.h = maxFrame.h/2
  win:setFrame(f)
end)

mashTo("R", function()
  hs.reload()
end)

mashTo("Left", function()
  setFrame(leftHalfFrameSpec)
end)

mashTo("Right", function()
  setFrame(rightHalfFrameSpec)
end)

mashTo("Up", function()
  setFrame(topHalfFrameSpec)
end)

mashTo("Down", function()
  setFrame(bottomHalfFrameSpec)
end)


nudgeTo("Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 20
  win:setFrame(f)
end)

nudgeTo("Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 20
  win:setFrame(f)
end)

nudgeTo("Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 20
  win:setFrame(f)
end)

nudgeTo("Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 20
  win:setFrame(f)
end)

nudgeTo("Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 20
  win:setFrame(f)
end)

alert.show("Config loaded")
