if place_meeting(x,y,obj_mainchara) && global.interacted == 1 && ran == 0{
	global.interacted = 0
	ran = 1
	scr_encounter_success()
	scr_battleinit("froggit_solo")
}