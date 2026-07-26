function scr_start_music(music, vol, loop){
	var priority = 67
	var add_vol
	
	if vol != 666 {
		if !audio_is_playing(music) {
			audio_play_sound(music,priority,loop)
		}
		if global.osflavor == "Mobile" {
			audio_sound_gain(music,vol+0.25,0)
		}
		else {
			audio_sound_gain(music,vol,0)
		}
		if global.lv >= 12 {
			audio_sound_pitch(music, 0.25)
			audio_sound_gain(music,vol * 4, 0)
		}
		global.current_song = music
	}
}