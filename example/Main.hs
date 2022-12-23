module Main where

import Raylib.Types (ConfigFlag(Msaa4xHint, VsyncHint))
import Raylib (setConfigFlags, initWindow, setTargetFPS, beginDrawing, clearBackground, closeWindow, endDrawing, windowShouldClose)
import Raylib.ImGui (rlImGuiSetup, rlImGuiShutdown, rlImGuiBegin, rlImGuiEnd)
import Raylib.Colors (darkGray)
import DearImGui (showDemoWindow)
import Control.Monad (unless)

main :: IO ()
main = do
  setConfigFlags [Msaa4xHint, VsyncHint]
  initWindow 1280 800 "rlImGui - simple window"
  setTargetFPS 44
  rlImGuiSetup True

  loop

  rlImGuiShutdown
  closeWindow

loop :: IO ()
loop = do
  beginDrawing
  clearBackground darkGray

  rlImGuiBegin

  showDemoWindow

  rlImGuiEnd

  endDrawing

  shouldClose <- windowShouldClose
  unless shouldClose loop
