scr_framerate_balancer()

if global.l_held == 0 {
	instance_destroy(obj_mouse_mark)
}

if global.no_mus == true {
	audio_sound_gain(global.current_song,0,0)
}
else {
	audio_sound_gain(global.current_song,global.current_mus_vol,0)
}