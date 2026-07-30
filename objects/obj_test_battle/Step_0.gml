if place_meeting(x,y,obj_mainchara) && global.interacted == 1 {
	global.interacted = 0
	scr_encounter_success()
}