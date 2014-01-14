import qualified XMonad.StackSet as W
import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.SetWMName
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/andrzej/.xmobarrc" 
  xmonad $ defaultConfig {
    workspaces = withScreens 2 myWorkspaces,
    startupHook = ewmhDesktopsStartup >> setWMName "LG3D",
    manageHook = myManageHook <+> manageHook defaultConfig,
    layoutHook = myLayout,
    -- for Chrome fullscreen
    handleEventHook = fullscreenEventHook,
    logHook = takeTopFocus >> dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle = xmobarColor "green" "" . shorten 50
    -- }, 
    }, 
    modMask = mod4Mask
  } `additionalKeys` myKeys
 
myWorkspaces = ["term","code","web","notes","temp"]

myManageHook = composeAll
  [ className =? "Google-chrome" --> doShift "1_web"
  , className =? "emulator-arm" --> doFloat
  , className =? "emulator64-arm" --> doFloat
  -- , className =? "emulator64-arm" --> doIgnore
  , manageDocks
  ]
 
myKeys = [
      ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
      , ((0, xK_Print), spawn "scrot")
      , ((mod4Mask, xK_i), spawn "google-chrome")
      , ((mod4Mask, xK_u), spawn "uxterm")
      , ((mod4Mask, xK_F12), spawn "xscreensaver-command -lock")
      , ((mod4Mask, xK_KP_Add), spawn "amixer sset 'Master' 2%+")
      , ((mod4Mask, xK_KP_Subtract), spawn "amixer sset 'Master' 2%-")
      , ((mod4Mask, xK_KP_Left), spawn "mdbus2 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
      , ((mod4Mask, xK_KP_Begin), spawn "mdbus2 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
      , ((mod4Mask, xK_KP_Right), spawn "mdbus2 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
    ]
    ++
    [
      ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myLayout = avoidStruts
  $ tiled ||| Mirror tiled ||| Full  
  where  
    -- default tiling algorithm partitions the screen into two panes  
    tiled = spacing 3 $ Tall nmaster delta ratio  
 
    -- The default number of windows in the master pane  
    nmaster = 1  
 
    -- Default proportion of screen occupied by master pane  
    ratio = 1/2  
 
    -- Percent of screen to increment by when resizing panes  
    delta = 3/100  
