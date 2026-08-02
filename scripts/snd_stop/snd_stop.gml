function snd_stop(_mus){
	if audio_is_playing(_mus) {
		audio_sound_gain(_mus, 0 , 0)
	}
}