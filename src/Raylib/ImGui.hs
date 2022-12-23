module Raylib.ImGui
  ( rlImGuiSetup,
    rlImGuiBegin,
    rlImGuiEnd,
    rlImGuiShutdown,
    rlImGuiBeginInitImGui,
    rlImGuiEndInitImGui,
    rlImGuiReloadFonts,
    rlImGuiImage,
    rlImGuiImageButton,
    rlImGuiImageSize,
    rlImGuiImageRect,
  )
where

import Foreign (Ptr, with)
import Raylib.Types (Rectangle, Texture)

-- basic API
foreign import ccall safe "rlImGui.h rlImGuiSetup" rlImGuiSetup :: Bool -> IO ()

foreign import ccall safe "rlImGui.h rlImGuiBegin" rlImGuiBegin :: IO ()

foreign import ccall safe "rlImGui.h rlImGuiEnd" rlImGuiEnd :: IO ()

foreign import ccall safe "rlImGui.h rlImGuiShutdown" rlImGuiShutdown :: IO ()

-- Advanced StartupAPI
foreign import ccall safe "rlImGui.h rlImGuiBeginInitImGui" rlImGuiBeginInitImGui :: IO ()

foreign import ccall safe "rlImGui.h rlImGuiEndInitImGui" rlImGuiEndInitImGui :: IO ()

foreign import ccall safe "rlImGui.h rlImGuiReloadFonts" rlImGuiReloadFonts :: IO ()

-- image API
foreign import ccall safe "rlImGui.h rlImGuiImage" c'rlImGuiImage :: Ptr Texture -> IO ()

foreign import ccall safe "rlImGui.h rlImGuiImageButton" c'rlImGuiImageButton :: Ptr Texture -> IO Bool

foreign import ccall safe "rlImGui.h rlImGuiImageSize" c'rlImGuiImageSize :: Ptr Texture -> Int -> Int -> IO ()

foreign import ccall safe "wrapper.h rlImGuiImageRect_" c'rlImGuiImageRect :: Ptr Texture -> Int -> Int -> Ptr Rectangle -> IO ()

rlImGuiImage :: Texture -> IO ()
rlImGuiImage texture = with texture c'rlImGuiImage

rlImGuiImageButton :: Texture -> IO Bool
rlImGuiImageButton texture = with texture c'rlImGuiImageButton

rlImGuiImageSize :: Texture -> Int -> Int -> IO ()
rlImGuiImageSize texture width height = with texture (\t -> c'rlImGuiImageSize t width height)

rlImGuiImageRect :: Texture -> Int -> Int -> Rectangle -> IO ()
rlImGuiImageRect texture width height rect = with texture (\t -> with rect (c'rlImGuiImageRect t width height))