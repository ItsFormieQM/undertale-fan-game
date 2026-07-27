if place_meeting(x,y,obj_mainchara) && ran == 0{
	global.canmove = false
	if global.frame_rate == 60 {
		alarm[0] = 1
		alarm[1] = 29
		alarm[2] = 10 // 60 fps ig
		alarm[3] = 32
	}
	else if global.frame_rate == 120 {
		alarm[0] = 1
		alarm[1] = 59
		alarm[2] = 30
		alarm[3] = 62
	}
	ran = 1
}
if global.debug == true {
	visible = true
}
else {
	visible = false
}