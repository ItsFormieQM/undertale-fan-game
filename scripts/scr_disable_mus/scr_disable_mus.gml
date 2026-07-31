function scr_disable_mus(){
	// old dumb me wrote ts to be more messy
	if audio_is_playing(global.current_song) && global.no_mus {
		audio_sound_gain(global.current_song,0,0)
	}
	else if !global.no_mus {
		audio_sound_gain(global.current_song,1,0)
	}
}