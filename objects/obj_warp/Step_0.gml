if global.frame_rate == 30 {
	global.stop_mus = _stop_mus
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
	global.stop_mus = _stop_mus
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
	global.stop_mus = _stop_mus
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

if transition_room == true && place_meeting(x,y,obj_mainchara) && transition_room != noone{
	global.stop_mus = _stop_mus
	global.room_trans = _room_trans
	scr_moveroom_parts(_next_room)
	transition_room = false
}

if !transition_room {
	global.stop_mus = _stop_mus
	_my_target = global.warplist[target_slot];
}
else {
	global.stop_mus = _stop_mus
	_my_target = global.warplist[_room_trans]
}