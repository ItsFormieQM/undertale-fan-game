function scr_start_music(music = global.current_song, vol, loop = true){
	var priority = 67
	var add_vol
	
	if !global.no_mus {
		if vol != 666 {
			if !audio_is_playing(music) {
				audio_play_sound(music,priority,loop)
			}
			if global.osflavor == "Mobile" && !global.no_mus{
				audio_sound_gain(music,vol+0.5,0)
			}
			else if global.osflavor == "PC" && !global.no_mus{
				audio_sound_gain(music,vol,0)
			}
		
			if music != snd_gameover {
				global.current_song = music
			}
		}
	}
	else if global.no_mus == true {
		audio_sound_gain(music,0,0)
	}
	else {
		audio_sound_gain(music,vol,0)
	}
}