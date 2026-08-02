
#region for menu moving
if (global.d_pressed || global.l_click == 1) && (isoccupied == 0){
	if box == 0 && abouttofight == 0{ // goto act bt
		obj_heartbattle_fr.x = 202
		obj_heartbattle_fr.y = 452
		obj_act.image_index = 1
		obj_fight.image_index = 0
		box++
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 1 { // goto item bt
		obj_heartbattle_fr.x = 363
		obj_heartbattle_fr.y = 452
		obj_act.image_index = 0
		obj_item.image_index = 1
		box++
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 2 { //goto spare bt
		obj_heartbattle_fr.x = 516
		obj_heartbattle_fr.y = 452
		obj_item.image_index = 0
		obj_spare.image_index = 1
		box++
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 3 { // goto fight bt
		obj_heartbattle_fr.x = 49
		obj_heartbattle_fr.y = 452
		obj_spare.image_index = 0
		obj_fight.image_index = 1
		box = 0
		scr_play_snd(snd_movemenu, 1.2)
	}
	global.l_click = 0
	
}
if global.a_pressed && (isoccupied == 0){
	if box == 0 && abouttofight == 0{ // go back to spare
		obj_heartbattle_fr.x = 516
		obj_heartbattle_fr.y = 452
		obj_fight.image_index = 0
		obj_spare.image_index = 1
		box = 3
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 1 { // go back to fight
		obj_heartbattle_fr.x = 49
		obj_heartbattle_fr.y = 452
		obj_fight.image_index = 1
		obj_act.image_index = 0
		box = 0
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 2 { // go back to act
		obj_heartbattle_fr.x = 202
		obj_heartbattle_fr.y = 452
		obj_act.image_index = 1
		obj_item.image_index = 0
		box = 1
		scr_play_snd(snd_movemenu, 1.2)
	}
	else if box == 3 { // go back to item
		obj_heartbattle_fr.x = 363
		obj_heartbattle_fr.y = 452
		obj_spare.image_index = 0
		obj_item.image_index = 1
		box = 2
		scr_play_snd(snd_movemenu, 1.2)
	}
	
}
if global.interacted == 1 {
	
	if box == 0 && abouttofight == 0 {
		isoccupied = 1
		abouttofight = 1 
		self.x = 68
		self.y = 286
		if instance_exists(obj_battle_writer) {
			instance_destroy(obj_battle_writer)
		}
		global.interacted = 0
		scr_play_snd(snd_select, 1.2)
	}
	else if box == 1 && abouttocheck == 0{
		isoccupied = 1
		abouttocheck = 1
		self.x = 68
		self.y = 286
		if instance_exists(obj_battle_writer) {
			instance_destroy(obj_battle_writer)
		}
		global.interacted = 0
		scr_play_snd(snd_select, 1.2)
	}
	
}
if global.interacted_x == 1 {
	if box == 0 && abouttofight == 1{
		isoccupied = 0
		obj_heartbattle_fr.x = 49
		obj_heartbattle_fr.y = 452
		obj_spare.image_index = 0
		obj_fight.image_index = 1
		box = 0
		abouttofight = 0 
		if !instance_exists(obj_battle_writer) {
			instance_create_layer(0,0,"SUBCHARA", obj_battle_writer)
		}
	}
	else if box == 1 && abouttocheck == 1 {
		isoccupied = 0
		obj_heartbattle_fr.x = 202
		obj_heartbattle_fr.y = 452
		obj_act.image_index = 1
		obj_fight.image_index = 0
		box = 1
		abouttocheck = 0 
		if !instance_exists(obj_battle_writer) {
			instance_create_layer(0,0,"SUBCHARA", obj_battle_writer)
		}
		global.interacted_x = 0
	}
	
}
#endregion
#region dedicated for fights
if abouttofight == 1 {
	if global.interacted == 1 {
		obj_battle_controller.attacked = 1
		global.interacted = 0
		show_debug_message("rannnnnnnnnn")
		abouttofight = 2 
		self.x = -666
		scr_play_snd(snd_select, 1.2)
	}
}
#endregion
#region Dedicated for acts
if global.interacted == 1   {
	if abouttocheck == 1 {
		global.interacted = 0 
		abouttocheck = 2 
		scr_play_snd(snd_select, 1.2)
		isoccupied = 1
	}
	else if abouttocheck == 2 {
		isoccupied = 1
		abouttocheck = 3
		scr_play_snd(snd_select, 1.2)
		if !instance_exists(obj_battle_writer) {
			instance_create_layer(0,0,"SUBCHARA",obj_battle_writer)
			writeforcheckk = 1
			self.x = -666
			obj_battle_controller.startattacking = 1
		}
		global.interacted = 0
	}
	else if writeforcheckk == 1 {
		obj_battle_controller.alarm[1] = 1
		
	}
}
if global.interacted_x == 1 {
	if abouttocheck == 2 {
		abouttocheck = 1
		global.interacted_x = 0
	}
}
#endregion