function scr_genocide_init(){
	if global.lv >= 11 {
		if global.current_song != mus_megalovania {
			audio_sound_pitch(global.current_song, 0.25)
			audio_sound_gain(global.current_song,4, 0)
		}
		global.genocide_route = 1
	}
	
}