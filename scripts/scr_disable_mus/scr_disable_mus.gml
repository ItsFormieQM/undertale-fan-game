function scr_disable_mus(){
	
	if audio_is_playing(snd_ruins) && global.no_mus == true {
		audio_sound_gain(snd_ruins,0,0)
	}
	else if global.no_mus == false {
		audio_sound_gain(snd_ruins,1,0)
	}
	
}