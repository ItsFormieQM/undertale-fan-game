function scr_encounter_success(){
	audio_play_sound(snd_encounter,67, false)
	global.canmove = false
	with (obj_mainchara) {
		if !instance_exists(obj_exclamation) {
			instance_create_layer(self.x,self.y - 30,"INSTANCES", obj_exclamation)
		}
		alarm[0] = 30
	}
	global.enctimer = 0
}