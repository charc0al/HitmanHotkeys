e_down := false ; track the state of the key to prevent re-triggering from key repeat
t_down := false ; track the state of t key

$e::
{
  if (!e_down) {
    e_down := true
	e_start := A_TickCount
	;send {y down}
	;send {y up}
	;tooltip start time = %StartTime%
  } else {
	if (!t_down) {
	  sleep 100
	  send {t down}
	  t_down := true
	}
  }
  return
}

$e Up::
{	
	e_down := false
	PressTime := A_TickCount - e_start
	tooltip presstime = %PressTime%
	if (presstime < 100) {
	  send {e down}
	  send {e up}
	} else {
	  send {t up}
	  t_down := false
	}
	return
}

#IfWinActive HITMAN
e::
if getKeyState("RButton", "p") { ; RMB pressed
  send {r down}
  send {r up}
} else {
  send {t down}
  send {y down}
}
;sleep 50
;send {y up}
return

k::
#SingleInstance, Force
; ;Space-Test
; Space::
; Send {Space down} 
; Sleep, 0.01
; Send {Space up}
; return


; send use button on key release so it doesn't get pressed at the same time as T (interact) and Y (retrieve/stash item)
#IfWinActive HITMAN
$e Up::
if getKeyState("RButton", "p") { ; RMB pressed
  ; do nothing
} else {
  send {t up}
  send {y up}
  sleep 10
  send {e down}
  send {e up}
}
return

#IfWinActive C
$WheelUp::
{
	if getKeyState("RButton", "p") {
	  send {WheelDown}
	  send {4 down}
	  send {4 up}
	} else {
	  send {WheelUp}
	}
	return
}

XButton1::
{
	
}

#IfWinActive HITMAN
$WheelDown::
{
	if getKeyState("RButton", "p") {
	  send {6 down}
	  send {6 up}
	} else {
	  send {WheelDown}
	}
	return
}