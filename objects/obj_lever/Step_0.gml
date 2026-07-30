if place_meeting(x,y,obj_mainchara) && global.interacted == 1 && ran == 0 {
	scr_play_snd(snd_noise, 1.55, false)
	image_index = 1
	ran = 1
	global.door[_target_door_open] = true
}
