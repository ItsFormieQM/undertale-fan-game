timer++

if timer == 30 {
	scr_play_snd(snd_noise, 1.25)
	scr_stop_mus(global.current_song)
	if !instance_exists(obj_heartbattle_actual) && !instance_exists(obj_flashblack){
		instance_create_layer(obj_mainchara.x, obj_mainchara.y,"BATTLE", obj_heartbattle_actual)
		instance_create_layer(obj_mainchara.x, obj_mainchara.y,"BATTLE", obj_flashblack)
	}
	obj_flashblack.image_alpha = 1
	obj_heartbattle_actual.image_alpha = 1
}

if timer == 38 {
	scr_play_snd(snd_noise, 1.25)
	//if !instance_exists(obj_heartbattle_actual) {
	//	instance_create_layer(obj_mainchara.x, obj_mainchara.y,"BATTLE", obj_heartbattle_actual)
	//}
	obj_flashblack.image_alpha = 0
	obj_heartbattle_actual.image_alpha = 0
}
if timer == 46 {
	scr_play_snd(snd_noise, 1.25)
	//if !instance_exists(obj_heartbattle_actual) {
	//	instance_create_layer(obj_mainchara.x, obj_mainchara.y,"BATTLE", obj_heartbattle_actual)
	//}
	obj_flashblack.image_alpha = 1
	obj_heartbattle_actual.image_alpha = 1
}
if timer ==  54{
	scr_play_snd(snd_bstart, 1.25)
	//if !instance_exists(obj_heartbattle_actual) {
	//	instance_create_layer(obj_mainchara.x, obj_mainchara.y,"BATTLE", obj_heartbattle_actual)
	//}
	obj_flashblack.image_alpha = 1
	obj_heartbattle_actual.image_alpha = 1
	
	
}
if timer >= 55 && complete == 0{
	with obj_heartbattle_actual {
		move_towards_point(obj_battle_marker.x,obj_battle_marker.y,4.5)
		if place_meeting(x,y,obj_battle_marker) {
			other.complete = 1
			speed = 0
			other.alarm[0] = 10
			show_debug_message("ikeptrunning")
			exit
		}
	}
	
}