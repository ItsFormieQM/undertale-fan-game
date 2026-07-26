function scr_stop_mus(mus){
	if audio_is_playing(mus) {
		audio_sound_gain(mus, 0, 250);
		instance_create_layer(0,0,"TECHNICAL", obj_mus_manager)
		obj_mus_manager.alarm[0] = 15
		obj_mus_manager.mus = mus
		global.current_song = 0
	}
}