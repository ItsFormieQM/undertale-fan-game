if place_meeting(x,y,obj_mainchara) && activated == false{
	alarm[0] = 29
	alarm[1] = 1
	global.canmove = false
	activated = true
	if _stop == true {
		scr_stop_mus(_music)
	}
}
if global.debug == true {
	visible = true
}
else {
	visible = false
}