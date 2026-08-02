if global.genocide_route != 0 {
	if place_meeting(x,y,obj_mainchara) && ran == 0 {
		ran = 1
		alarm[0] = 3
		global.canmove = false
		obj_mainchara.y -= 3
	}
	else if !place_meeting(x,y,obj_mainchara) && ran == 1 {
		ran = 0
	}
}
if global.debug {
	visible = true
}
else {
	visible = false
}