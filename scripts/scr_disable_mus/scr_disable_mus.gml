function scr_disable_mus(){
	// old dumb me wrote ts to be more messy
	if !audio_is_paused(global.current_song) && global.no_mus {
		
		audio_pause_sound(global.current_song)
	}
	else if !global.no_mus && audio_is_paused(global.current_song){
		audio_resume_sound(global.current_song)
	}
}