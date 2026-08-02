//obj_heartbattle_fr.fight = 0
//global.interacted_x = 1
//var inst = global.enemy_inst
//inst.was_hit = 0
//inst.shake_timer = 25
//inst.ran = 0
//global.l_click = 0
//obj_heartbattle_fr.x = 48
//obj_heartbattle_fr.y = 452
//box = 0
//obj_act.image_index = 0
//obj_fight.image_index = 1
if end_battle_violently == 0 {
	if instance_exists(obj_battle_writer) {
		instance_destroy(obj_battle_writer)
	}
	obj_heartbattle_fr.isoccupied = 1
	//if instance_exists(obj_heartbattle_fr) {
	//	instance_destroy(obj_heartbattle_fr)
	//}
	instance_destroy(obj_targetb)
	instance_destroy(obj_targetmark)
	//instance_create_layer(320,285,"BATTLE",obj_froggit_bullets)
	resize = 1
	miss = 0
}
else {
	instance_destroy(obj_targetb)
	instance_destroy(obj_targetmark)
	obj_heartbattle_fr.fight = 0
	global.interacted_x = 1
	var inst = global.enemy_inst
	inst.was_hit = 0
	inst.shake_timer = 25
	inst.ran = 0
	global.l_click = 0
	if !instance_exists(obj_heartbattle_fr) {
		instance_create_layer(0,0,"Instances",obj_heartbattle_fr)
	}
	obj_heartbattle_fr.x = 48
	obj_heartbattle_fr.y = 452
	box = 0
	obj_act.image_index = 0
	obj_fight.image_index = 1
	obj_heartbattle_fr.fight = 0	
	attacked = 0
	atk_ran = 0
	atk_timer = 0
	audio_stop_sound(global.battle_mus)
	global.next_msg = 0
	global.battle_msg[0] = "* You Won!"
}
obj_heartbattle_fr.writeforcheckk = 0