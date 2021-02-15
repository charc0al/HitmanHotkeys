#IfWinActive HITMAN
e::
send {t down}
send {y down}
;sleep 50
;send {y up}
return

; send use button on key release so it doesn't get pressed at the same time as T (interact) and Y (retrieve/stash item)
#IfWinActive HITMAN
e Up::
send {t up}
send {y up}
sleep 100
send {e down}
sleep 50
send {e up}
return

#IfWinActive HITMAN
RButton & WheelUp::
send {4 down}
sleep 50
send {4 up}
return

#IfWinActive C
WheelDown::
{
	if getKeyState("RButton", "p") {
	  send {4 down}
	  sleep 50
	  send {4 up}
	} else {
	  send {WheelDown} //normal function
	}
	return
}

E & RButton::
{	
	tooltip "shoulda switch"
}
