if place_meeting(x,y,obj_mainchara) && ran == 0{
	ran = 1
	with _self_id {
		image_index = 1
	}
	scr_play_snd(snd_noise, 1.55, false)
}