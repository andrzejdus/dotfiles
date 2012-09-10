import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Actions.CycleWS
import XMonad.Layout.IndependentScreens
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.UpdatePointer
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/andrzej/.xmobarrc" 
  xmonad $ defaultConfig {
    workspaces = withScreens 2 myWorkspaces,
    manageHook = myManageHook <+> manageHook defaultConfig,
    layoutHook = avoidStruts  $  layoutHook defaultConfig,
    logHook = dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle = xmobarColor "green" "" . shorten 50
    } >> updatePointer (Relative 0.5 0.5), 
    modMask = mod4Mask
  } `additionalKeys` myKeys
 
myWorkspaces = ["term","code","web","notes","temp"]

myManageHook = composeAll
  [ className =? "Google-chrome" --> doShift "1_web"
  , manageDocks
  ]
 
myKeys = [
      ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
      , ((0, xK_Print), spawn "scrot")
      , ((mod4Mask, xK_i), spawn "google-chrome")
      , ((mod4Mask, xK_u), spawn "uxterm")
      , ((mod4Mask, xK_F12), spawn "xscreensaver-command -lock")
    ]
    ++
    [
      ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip myWorkspaces [xK_1 .. xK_9],
      (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
