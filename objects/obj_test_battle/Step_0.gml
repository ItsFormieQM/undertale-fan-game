if place_meeting(x,y,obj_mainchara) && global.interacted == 1 && ran == 0{
	global.interacted = 0
	ran = 1
	if _lv_amnt != 0 {
		global.genocide_route = 1
		global.lv = 19
		global.max_hp = 92
		global.hp = global.max_hp
	}
	scr_encounter_success()
	scr_battleinit(string(_battlegroup))
}
if global.debug {
	visible = true
}
else {
	visible = false
	
}