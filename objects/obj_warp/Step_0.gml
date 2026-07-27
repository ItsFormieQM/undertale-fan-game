if global.frame_rate == 30 {
	if place_meeting(x,y,obj_mainchara) && activated == false{
		alarm[0] = 14
		alarm[1] = 1
		global.canmove = false
		activated = true
		if _stop == true {
			scr_stop_mus(_music)
		}
	}	
}
else if global.frame_rate == 60 {
	if place_meeting(x,y,obj_mainchara) && activated == false{
		alarm[0] = 29
		alarm[1] = 1
		global.canmove = false
		activated = true
		if _stop == true {
			scr_stop_mus(_music)
		}
	}
}
else if global.frame_rate == 120 {
	if place_meeting(x,y,obj_mainchara) && activated == false{
		alarm[0] = 59
		alarm[1] = 1
		global.canmove = false
		activated = true
		if _stop == true {
			scr_stop_mus(_music)
		}
	}

}
if global.debug == true {
	visible = true
}
else {
	visible = false
}