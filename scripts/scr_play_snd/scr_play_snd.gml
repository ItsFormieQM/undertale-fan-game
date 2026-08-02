function scr_play_snd(snd, vol = 5, loop = false){
	loop = false
	var priority = irandom_range(1,1024)
	if global.osflavor == "Mobile" {
		audio_play_sound(snd,priority,loop)
		audio_sound_gain(snd,vol+0.35,0)
	}
	else {
		audio_play_sound(snd,priority,loop)
		audio_sound_gain(snd,vol,0)
	}
}