function scr_play_snd(snd, vol, loop){
	loop = false
	if global.osflavor == "Mobile" {
		audio_play_sound(snd,67,loop)
		audio_sound_gain(snd,vol+0.35,0)
	}
	else {
		audio_play_sound(snd,67,loop)
		audio_sound_gain(snd,vol,0)
	}
}