;================================================================
;AutoHotKey script using like Mac for windows 
;================================================================
#InstallKeybdHook
#UseHook
;================================================================
;function
;================================================================
;----------------------------------------------------------------
;Determine if a window should have its key bindings disabled.
; Use AU3_Spy.exe, which comes with AutoHotKey, to check ahk_class.
;  argument none
;  return 1: Disable key bindings window
;         0: Enable key bindings window
;----------------------------------------------------------------
is_disable_window()
{
;gvim
IfWinActive,ahk_class Vim
{
return 1
}
;tera term
IfWinActive,ahk_class VTWin32
{
return 1
}
;vmware player
IfWinActive,ahk_class VMPlayerFrame
{
return 1
}
return 0
}
;----------------------------------------------------------------
;Send a key
; In the Disable Key Bindings window, use the sent key as is
; In the Enable Key Bindings window, replace the sent key
;
;  argument original_key: The key to be sent if the window disables key bindings
;           replace_key: The key to be sent if the window enables key bindings
;  return none
;----------------------------------------------------------------
send_key(original_key,replace_key)
{
if (is_disable_window())
{
Send,%original_key%
return
}
Send,%replace_key%
return
}
;================================================================
;ctrl key bindings
;================================================================
;----------------------------------------------------------------
;Moving System
;ctrl + n : Down
;ctrl + p : Up
;ctrl + f : Right
;ctrl + b : Left
;ctrl + a : Home
;ctrl + e : End
;----------------------------------------------------------------
<^n::send_key("^n","{Down}")
<^+n::send_key("^+n","+{Down}")
<^p::send_key("^p","{Up}")
<^+p::send_key("^+p","+{Up}")
<^f::send_key("^f","{Right}")
<^+f::send_key("^+f","+{Right}")
<^b::send_key("^b","{Left}")
<^+b::send_key("^+b","+{Left}")
<^a::send_key("^a","{Home}")
<^+a::send_key("^+a","+{Home}")
<^e::send_key("^e","{End}")
<^+e::send_key("^+e","+{End}")
;----------------------------------------------------------------
;Editing System
;ctrl + h : BackSpace
;ctrl + d : Delete
;ctrl + m : Enter
;ctrl + k : Delete from the cursor to the end of the line
;ctrl + space : Switch between half/full-width
;
;References
;https://www.karakaram.com/mac-control/
;https://so-zou.jp/software/tool/system/auto-hot-key/hotkeys/
;----------------------------------------------------------------
<^h::send_key("^h","{BS}")
<^d::send_key("^d","{Del}")
<^m::send_key("^m","{Return}")
<^k::send_key("^k","+{End}{Del}")
<^Space::send_key("^Space","{sc029}")