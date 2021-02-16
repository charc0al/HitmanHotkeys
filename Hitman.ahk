e_down := false ; track the state of the key to prevent re-triggering from key repeat
t_down := false ; track the state of t key
xb2_down := false 

$e::
{
  if (!e_down) {
	if getKeyState("RButton", "p") { ; RMB pressed
      send {r down}
      send {r up}
	  return
    } else {
	  e_down := true
	  e_start := A_TickCount
      if (!t_down) {
	    sleep 100
		if (getKeyState("E", "P")) {
		  send {t down}
	      t_down := true
		}
	  }
    }
  }
  return
}

$e Up::
{
  send {t up}
  e_down := false
  t_down := false
  if getKeyState("RButton", "p") { ; RMB pressed
    ; do nothing
  } else {
    PressTime := A_TickCount - e_start
    if (presstime < 100) {
      send {e down}
      send {e up}
	  sleep 100
	  send {y down}
	  send {y up}
    }
  }
  return
}

XButton2::
{
  if (!xb2_down) {
    xb2_down := true
	xb2_start := A_TickCount
	sleep 200
	if (getKeyState("XButton2", "P")) {
	  send {Tab down}
	  send {Tab up}
	}
  }
  return
}

XButton2 Up::
{
  xb2_down := false
  xb_time := A_TickCount - xb2_start
  if (xb_time < 200) {
    send {1 down}
	send {1 up}
	return
  }
  send {RButton down}
  send {RButton up}
  return
}

#IfWinActive HITMAN
$WheelUp::
{
	if (xb2_down or getKeyState("RButton", "p")) {
	  send {WheelDown}
	  send {4 down}
	  send {4 up}
	} else {
	  send {WheelUp}
	}
	return
}

#IfWinActive HITMAN
$WheelDown::
{
  if (xb2_down or getKeyState("RButton", "p")) {
    send {6 down}
    send {6 up}
  } else {
    send {WheelDown}
  }
  return
}